var mysql = require('mysql');
 
console.log('Get connection ...');
 
var conn = mysql.createConnection({
  database: 'rentemall',
  host: "localhost",
  user: "root",
  password: "Group8"
});
 
conn.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});