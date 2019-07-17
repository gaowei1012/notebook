const jwt = require('jsonwebtoken');
const serect = 'token';

/// token
module.exports = (userInfo) => {
  const token = jwt.sign({
    user: userInfo.user,
    id: userInfo.id
  }, serect, {expiresIn: '1h'});
  return token;
}
