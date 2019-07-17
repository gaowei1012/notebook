const bcrypt = require('bcrypt');

/// 密码加盐加密
exports.addBcrypt = async password => {
  const saltRounds = 10;
  const slat = bcrypt.genSaltSync(saltRounds);
  const hash = bcrypt.hashSync(password, slat)
  return hash;
}
