const mongoose = require('mongoose')
const Schmea = mongoose.Schema;

const UserSchmea = new Schmea({
  username: {
    type: String,
    unique: true,
    require: true
  },
  password: {
    type: String,
    require: true
  },
  email: { type: String, require: true },
  createAt: { type: Date, default: Date.now() },
  lastLoginAt: { type: Date, default: Date.now() }
});

module.exports = mongoose.model("User", UserSchmea);