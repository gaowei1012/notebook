const axios = require('axios');

/// 拦截器
const instance = axios.create({
  baseUrl: `http://${process.env.HOST} || localhost:${process.env.PORT || 3030}`,
  timeout: 1000,
  haeder: {}
})

module.exports = instance;