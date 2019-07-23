
/// 继承
function Father(name) {
  this.colors = [1, 2, 4, 5];
  this.name = name;
}

/// Father 的实例
Father.prototype.sayName = function() {
  alert(this.name)
}

function Son(name,age) {
  /// 为了保证实例不被共享
  Father.call(this, name);
  this.age = age;
}

/// 次数继承父类方法
extend(Son, Father);
Son.prototype.sayAge = function() {
  alert(this.age)
}

let instanerof1 = new Son('lusy', 5);
instanerof1.colors.push(666)
console.log(instanerof1.colors)
instanerof1.sayName()
instanerof1.sayAge()

let instanerof2 = new Son('执念',18);

instanerof2.sayName();
instanerof2.sayAge();


/**
 * 实现一个new方法
 */
function mynew() {
  var obj = new Object()
  Constructor = [].shift.call(arguments)
  obj.__proto__ = Constructor.prototype
  Constructor.apply(obj, arguments)
  return obj;
}