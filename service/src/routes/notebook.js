const Router = require('koa-router');
const controller = require('../controller/notebook');
const router = new Router({
  prefix: '/api', /// 统一路由路径
})

router.get('/all', controller.getAll);

router.post('/post-page', controller.postPage);


module.exports = router;