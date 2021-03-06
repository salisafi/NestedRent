const express = require('express');
const app = express();
const path = require("path");
const http = require('http');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const session = require('express-session');

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

app.use(express.static('Rent-emAll-Web-Portal'));
app.use(bodyParser.urlencoded({extended:true}));
app.use(session({ 
  secret: '@#@$MYSIGN#@$#$',
  resave: false,
  saveUninitialized: true
}));

/*************** GET Request **************/

app.get("/", function(req,res){
  var sess = req.session;
  console.log(sess);
  res.sendFile(path.join(__dirname + '/Rent-emAll-Web-Portal/index.html'));
});

app.get('/logout', function(req, res){
  var sess = req.session;
  if (sess.username){
    req.session.destroy(function (err) {
      if (err) {
        console.log('Logout Error: ' + err);
      } else {
        res.redirect('/');
      }
    })
  } else {
    res.redirect('/');
  }
});


/*************** POST Request **************/

app.post('/signup', function (req, res) {
  var body = req.body;
  var key = 'myKey';
  var cipher = crypto.createCipher('aes192', key);
  cipher.update(body.password, 'utf8', 'base64');
  var cipheredOutput = cipher.final('base64');

  connection.query("INSERT INTO UserTbl (firstName, lastName, userName, password, emailAddress, phoneNumber, postalCode) VALUES (?, ?, ?, ?, ?, ?, ?)", [
      body.firstname, body.lastname, body.username, cipheredOutput, body.email, body.phoneNum, body.postalcode
    ], function() {
    res.end();
  });
});

app.post('/login', function(req, res) {
  var userid = req.body.username;
  var password = req.body.password;
  var key = 'myKey';
  var sess = req.session;

  connection.query('SELECT * FROM UserTbl WHERE BINARY userName = ?', [userid], function(err, result) {
    if (err) {
      console.log('Error: ' + err);
    } else {
      if (result.length === 0) {
	res.send('Invalid Username!');
      } else {
	var decipher = crypto.createDecipher('aes192', key);
	decipher.update(result[0].password, 'base64', 'utf8');
        var decipheredOutput = decipher.final('utf8');
	console.log('check password');
	if (password != decipheredOutput) {
	  res.send('Invalid Password!');
	} else {
	  sess.username = result[0].userName;
	  sess.name = result[0].firstName + ' ' + result[0].lastName;
	  //res.write(sess.username + '\n');
	  //res.write(sess.name);
	  //res.end();
	  res.redirect('/');
	}
      }
    }
  }); 
});

app.post('/forgotuser', function(req, res) {

});

app.post('/forgotpass', function(req, res) {

});

app.post('/postItem', function (req, res) {
  var body = req.body;
  var key = 'myKey';
//  var cipher = crypto.createCipher('aes192', key);
//  cipher.update(body.password, 'utf8', 'base64');
//  var cipheredOutput = cipher.final('base64');

  connection.query("INSERT INTO ItemTbl (categoryId, name, description, brand, madeYear, color, weight, purchasedYear, purchasedPrice, postalCode, province, photoURL, creationDate) VALUES (?, ?, ?, ?, ?, ?, ?)", [
      "2", body.name, body.name, body.description, body.brand , "1985" , "red" , "54.24" , "2004" , "50.00". , "L3T2E9" , "Toronto" , body.photoURL , "Oct 28,2017"
    ], function() {
    res.end();
  });
});

/*************** 404 Not Found **************/

app.all('*', function (req, res) {
  res.status(404).send('<h1>Error 404: Page Not Found</h1>');
});


