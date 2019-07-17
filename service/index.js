const Koa = require('koa');
const bodyParser = require('koa-bodyparser');
const sessionRedis = require('koa-generic-session');
const Redis = require('koa-redis');
const logger = require('koa-logger');
const json = require('koa-json');
const cors = require('koa2-cors');
const Router = require('koa-router');
const { initSchema, connect } = require('./src/lib/init');
const passport = require('./src/utils/instance/passport');

const app = new Koa();

const router = new Router()

// redis session
app.keys = ['blogs', 'keyskeys'];
app.use(sessionRedis({key: 'blogs', prefix: 'blogs:uid', store: new Redis()}))

app.use(cors());
app.use(bodyParser());
app.use(json());
app.use(logger());

app.use(passport.initialize())
app.use(passport.session())

/// 初始化数据库链接
;(async () => {
  await connect(),
  initSchema()
})();

// routes
app.use(require('./src/routes/user').routes());
app.use(require('./src/routes/notebook').routes());

app.listen(3030, () => {
  console.log("server statrd port 3030");
});
