const mongoose = require('mongoose')
const DBConfig = require('../config/base')
const glob = require('glob')
const { resolve } = require('path')

exports.initSchema = () => {
  glob.sync(resolve(__dirname, './models', '**/*.js')).forEach(require)
}

exports.connect = () => {
  mongoose.connect(DBConfig.dbs)
  let maxconnection = 0

  return new Promise((resolve,reject) => {
    mongoose.connection.on('disconnected', () => {
      console.log('数据库连接成功')
      if (maxConnection <= 3) {
        maxConnection++
        mongoose.connect(url)
      } else {
        reject()
        throw new Error('数据库连接失败,请检查数据库是否正常开启')
      }
    })

    mongoose.connection.on('error', () => {
      console.log('数据库连接失败')
      if (maxConnection <= 3) {
        maxConnection++
        mongoose.connect(url)
      } else {
        reject()
        throw new Error('数据库连接失败,请检查数据是否正常打开')
      }
    })

    mongoose.connection.once('open', () => {
      console.log('数据库打开成功')
      resolve()
    })
  })
}