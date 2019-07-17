
exports.getAll = async (ctx, next) => {
  ctx.body = '终于等到你,还好我没放弃!';
  await next();
}


exports.postPage = async (ctx, next) => {
  ctx.body = 'post page';
  await next();
}