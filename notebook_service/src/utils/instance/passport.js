const passport = require('koa-passport');
const localStrategy = require('passport-local');
const userModel = require('../../lib/models/user');

passport.use(new localStrategy(async function(username, password, done) {
  let where = { username };

  let result = await userModel.findOne(where)
  if (result != null) {
    if (result.password === password) {
      /// 登录成功
      return done(null, result);
    } else {
      return done(null, false, '密码错误')
    }
  } else {
    return done(null, false, '用户不存在')
  }
}));

passport.serializeUser(function(user, done) {
  done(null, user);
});

passport.deserializeUser(function(user, done) {
  return done(null, user);
});

module.exports = passport;
