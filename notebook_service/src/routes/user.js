const Router = require('koa-router');
const controller = require('../controller/user');

let router = new Router({
  prefix: '/api'
})

router.get('/', controller.getUser);

router.get('/user/verify', controller.getVerify);

router.post('/user/signin', controller.postSignin);

router.post('/user/signup', controller.postSignup);

router.get('/user/exit', controller.getExit);

module.exports = router;
