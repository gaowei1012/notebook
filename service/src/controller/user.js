/// user contorller
const Redis = require('koa-redis')
const nodeMailer = require('nodemailer')
const User = require('../lib/models/user')
const Email = require('../config/base')
const Passport = require('../utils/instance/passport')
const axios = require('../utils/instance/axios')
const addToken = require('../utils/auth/token')
// const { addBcrypt } = require('../utils/bcrypt')
const bcrypt = require('bcryptjs')

// redis store
let Store = new Redis().client

/// 注册
exports.postSignup = (async (ctx) => {
  const {username, password, email, code} = ctx.request.body;

  /// 是否带有验证码
  if (code) {
    const saveCode = await Store.hget(`nodemail:${username}`, 'code')
    const saveExpire = await Store.hget(`nodemail:${username}`, 'expire')
    if (code === saveCode) {
      if (new Date().getTime() - saveExpire > 0) {
        ctx.body = {
          code: -1,
          msg: '验证码已过期，请重新尝试'
        }
        return false
      }
    } else {
      ctx.body = {
        code: -1,
        msg: '请填写正确的验证码'
      }
    }
  } else {
    ctx.body = {
      code: -1,
      msg: '请填写验证码'
    }
  }
  let user = await User.find({username})
  if (user.length) {
    ctx.body = {
      code: -1,
      msg: '已被注册'
    }
    return
  }

  let nuser = await User.create({username, password, email})
  if (nuser) {
    /// 加密处理
    let saltRounds = 10;
    let slat = bcrypt.genSaltSync(saltRounds);
    let npassword = bcrypt.hashSync(password, slat);

    let res = await axios.post('/users/signin', {username, npassword})
    if (res.data && res.data.code === 0) {
      ctx.body = {
        code: 0,
        msg: '注册成功',
        user: res.data.user
      }
    } else {
      ctx.body = {
        code: -1,
        msg: 'error'
      }
    }
  } else {
    ctx.body = {
      code: -1,
      msg: '注册失败'
    }
  }
})

/// 登录
exports.postSignin = (async (ctx, next) => {
  let username = ctx.request.body;
  let token = addToken({user:`${username}`.user,id:`${username}`.id})
  return Passport.authenticate('local', function(err, user, info, status) {
    if (err) {
      ctx.body = {
        code: -1,
        msg: err
      }
    } else {
      if (user) {
        ctx.body = {
          code: 0,
          msg: '登陆成功',
          user,
          token
        }
        return ctx.login(user)
      } else {
        ctx.body = {
          code: 1,
          msg: info
        }
      }
    }
  })(ctx, next)
})

// 验证码校验
/**
 * 邮箱验证
 * 拿到当前用户 在redis中查询 是否有当前用户 进行比对
 * 发送您验证邮箱，使用 nodemailer 
 * 首先设置发送前设置 再者就是发送给谁
 */
exports.getVerify = (async (ctx, next) => {
  let username = ctx.request.body.username
  const saveExpire = await Store.hget(`nodemail:${username}`, 'expire')
  if (saveExpire && new Date().getTime() - saveExpire < 0) {
    ctx.body = {
      code: -1,
      msg: '验证请求过于频繁，1分钟内1次'
    }
    return false
  }

  let transporter = nodeMailer.createTransport({
    host: Email.smtp.host,
    port: 465,
    service: 'qq',
    secure: true,
    auth: {
      user: Email.smtp.user,
      pass: Email.smtp.pass
    }
  })
  let ko = {
    code: Email.smtp.code(),
    expire: Email.smtp.expire(),
    email: ctx.request.body.email,
    user: ctx.request.body.username
  }
  let mailOptions = {
    from: `"认证邮件" <${Email.smtp.user}>`,
    to: ko.email,
    subject: 'node应用注册码',
    html: `您在《体验node》项目中注册，您的邀请码是:${ko.code}`
  }
  await transporter.sendMail(mailOptions, (error, info) => {
    if (error) return console.log('获取邮箱验证失败'+ error)
    else Store.hmset(`nodemail:${ko.user}`, `code:${ko.code}`, `emial:${ko.email}`)
  })
  ctx.body = {
    code: 0,
    msg: '验证码已发送，可能会有延时，有效期1分钟'
  }

  await next()
})

exports.getExit = (async (ctx, next) => {
  await ctx.logout()
  if (!ctx.isAuthenticated()) {
    ctx.body ={
      code:0
    }
  } else {
    ctx.body = {
      code: -1
    }
  }

  await next()
})

exports.getUser = (async (ctx, next) => {
  if (ctx.isAuthenticated()) {
    const {username, email} = ctx.session.passport.user 
    ctx.body = {
      user: username,
      email
    }
  } else {
    ctx.body = {
      user: '',
      email: ''
    }
  }
  await next()
})

