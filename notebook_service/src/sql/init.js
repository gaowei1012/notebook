const mysql = require("mysql");
const config = require("../config/index");

const Pool = mysql.createPool({
  host: config.database.HOST,
  user: config.database.USERNAME,
  password: config.database.PASSWORD,
  database: config.database.DATABASE,
  port: config.database.PORT
});

/**
 *
 * @param {SQL} sql sql 语句
 * @param {String} values values
 */
let query = (sql, values) => {
  return new Promise((resolve, reject) => {
    Pool.getConnection(function(err, connection) {
      if (err) {
        reject(err);
      } else {
        connection.query(sql, values, (err, rows) => {
          if (err) {
            reject(err);
          } else {
            resolve(rows);
          }
          connection.release();
        });
      }
    });
  });
};

let users = `
  create table if not exists users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL COMMENT '用户名',
    password VARCHAR(100) NOT NULL COMMENT '密码',
    email INT NOT NULL COMMENT '邮箱',
    PRIMARY KEY (id)
  );
`;

// let posts = `
//   create table if not exists posts (
//     id INT NOT NULL AUTO_INCREMENT,
//     author VARCHAR(100) NOT NULL COMMENT '文章作者',
//     title TEXT(0) NOT NULL COMMENT '文章标题',
//     content TEXT(0) NOT NULL COMMENT '评论内容',
//     createTime VARCHAR(100) NOT NULL COMMENT '发表时间',
//     lastTime VARCHAR(100) NOT NULL COMMENT '最后修改时间',
//     uid VARCHAR(40) NOT NULL COMMENT '用户id',
//     md TEXT(0) NOT NULL COMMENT 'markdown',
//     comments VARCHAR(200) NOT NULL DEFAULT '0' COMMENT '文章评论数',
//     pv VARCHAR(40) NOT NULL DEFAULT '0' COMMENT '浏览量',
//     PRIMARY KEY (id)
//   )
// `;

// let articleDetail = `
//   create table if not exists articleDetail (
//     id INT NOT NULL AUTO_INCREMENT,
//     author VARCHAR(100) NOT NULL COMMENT '文章作者',
//     title TEXT(0) NOT NULL COMMENT '文章标题',
//     connent TEXT(0) NOT NULL COMMENT '文章内容',
//     tags VARCHAR(100) NOT NULL COMMENT 'tags',
//     createTime VARCHAR(100) NOT NULL COMMENT '创建时间',
//     PRIMARY KEY ( id )
//   )
// `;

// let comment = `
//   create table if not exists comment (
//     id INT NOT NULL AUTO_INCREMENT,
//     name VARCHAR(100) NOT NULL COMMENT '用户名',
//     emial VARCHAR(100) NOT NULL COMMENT '邮箱',
//     content TEXT(0) NOT NULL COMMENT '评论内容',
//     PRIMARY KEY ( id )
//   )
// `;

let notebook = `
  create table if not exists notebook (
    id INT NOT NULL AUTO_INCREMENT,
    title TEXT(0) NOT NULL COMMENT '标题',
    author VARCHAR(100) NOT NULL COMMENT '发布者',
    time VARCHAR(100) NOT NULL COMMENT '日期',
    content VARCHAR(100) NOT NULL COMMENT '内容',
    createTime VARCHAR(100) NOT NULL COMMENT '创建时间',
    PRIMARY KEY ( id )
  )
`;

let createTable = sql => {
  return query(sql, []);
};

createTable(users)
// createTable(articleDetail);
// createTable(posts);
// createTable(comment);
createTable(notebook);

// 用户注册
exports.insertUser = value => {
  let _sql = `insert into users set username=?, password=?, email=?;`;
  return query(_sql, value)
}

// 用户登录
exports.findOneceUser = name => {
  let _sql = `select users from table where username=${name};`;
  return query(_sql)
}

// 创建一篇笔记
exports.insterPosts = value => {
  let _sql = `insert into notebook set id=?, content=?, time=?, author=?, createTime=?`;
  return query(_sql, value);
}

// // 发表文章
// exports.insterPosts = value => {
//   let _sql = `insert into posts set id=? author=?, title=?, content=?, createTime=?, lastTime=?, uid=?, md=?, comments=?, pv=?;`;
//   return query(_sql, value);
// };

// // 所有文章
// exports.getArticle = value => {
//   let _sql = `select * from posts;`;
//   return query(_sql, value)
// }

// // 更新一篇文章
// exports.updateArticle = value => {
//   let _sql = `update posts set title=?, content=?, md=? where id=?;`;
//   return query(_sql, value)
// } 

// // 删除文章
// exports.deleteArticle = id => {
//   let _sql = `delete from posts where id=${id};`
//   return query(_sql)
// }

// // 添加评论
// exports.addCommentInsert = value => {
//   let _sql = `insert into comment set name=?, emial=?, content=?;`;
//   return query(_sql, value)
// }

// // 删除评论
// exports.removeComment = id => {
//   let _sql = `delete from comment where id=${id};`;
//   return query(_sql)
// }
