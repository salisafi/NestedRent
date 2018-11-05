const express = require('express');
const app = express();
const path = require("path");
const http = require('http');
const mysql = require('mysql');
const bodyParser = require('body-parser');

const hostname = '10.10.193.142';
const port = 10034;

var crypto = require('crypto');

const server = http.createServer(app).listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}`);
});

var connection = mysql.createConnection({
  database: 'prj566_182a08',
  host: 'zenit.senecac.on.ca',
  path: '/phpMyAdmin/',
  user: 'prj566_182a08',
  password: 'jaMW2249'
});

connection.connect(function (err) {
  if (err) throw err;
  console.log("Database connected successfully.");
});

app.get("/", function(req,res){
  res.sendFile(path.join(__dirname + '/Rent-emAll-Web-Portal/index.html'));
});

app.use(express.static('Rent-emAll-Web-Portal'));
app.use(bodyParser.urlencoded({extended:true}));

app.post('/signup', function (req, res) {
  var body = req.body;
  var key = 'myKey';

  var cipher = crypto.createCipher('aes192', key);
  cipher.update(body.password, 'utf8', 'base64');
  var cipheredOutput = cipher.final('base64');

  res.write('Username: ' + body.username + '\n');
  res.write('Password: ' + body.password + '\n');
  res.write('Ciphered: ' + cipheredOutput + '\n');
  res.write('Name: ' + body.firstname + ' ' + body.lastname + '\n');
  res.write('Email: ' + body.email + '\n');
  res.write('Phone: ' + body.phoneNum + '\n');
  res.write('PostalCode: ' + body.postalcode + '\n');
  res.end()

  connection.query("INSERT INTO UserTbl (firstName, lastName, userName, password, emailAddress, phoneNumber, postalCode) VALUES (?, ?, ?, ?, ?, ?, ?)", [
      body.firstname, body.lastname, body.username, body.password, body.email, body.phoneNum, body.postalcode
    ], function() {
    res.redirect("/signup");
  });
});

app.post('/login', function(req, res) {
  var userid = req.body.username;
  var password = req.body.password;

  connection.query('SELECT * FROM UserTbl WHERE userName = ?', [userid], function(err, result) {
    if (err) {
      console.log('Error: ' + err);
    } else {
      if (result.length === 0) {
	res.send('Invalid Username!');
      } else {
	if (password != result[0].password) {
	  res.send('Invalid Password!');
	} else {
	  res.send('Login Success!');
	}
      }
      res.end();
    }
  });
});
