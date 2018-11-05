// app.js
 const mysql = require('mysql');

 // console.log('Sali MUST make it!!!!');
 
console.log('Get connection ...');
 
var conn = mysql.createConnection({
  database: 'prj566_182a08',
  host: "zenit.senecac.on.ca",
  path: '/phpMyAdmin/',
  user: "prj566_182a08",
  password: "jaMW2249"
});
 
conn.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
  var sql = "CREATE TABLE PRJ_666 (course_name VARCHAR(15), course_code VARCHAR(10))";
  conn.query(sql, function (err, result) {
    if (err) throw err;
    console.log("Table created");
  });
});