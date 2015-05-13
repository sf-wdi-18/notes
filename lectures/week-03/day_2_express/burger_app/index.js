// index.js
var express = require("express");
var path = require("path");
var bodyParser = require("body-parser"); // add require

var app = express();
app.use(bodyParser.urlencoded({extended: true}))

var viewsDir = path.join(process.cwd(), "views");

var burgers = [
                "hamburger",
                "cheese burger",
                "dble cheese burger"
              ];


// the root route
app.get("/", function (req, res) {
  var homePath = path.join(viewsDir, "home.html");
  res.sendFile(homePath);
});


app.get("/burgers", function (req, res) {
  var burgersText = burgers.join(", ");
  res.send(burgersText);
});


app.get("/contact", function (req, res) {
  var contactPath = path.join(viewsDir, "contact.html");
  res.sendFile(contactPath);
});

app.post("/burgers", function (req, res) {
  console.log(req.body.burger)
  var burger = req.body.burger;
  burgers.push(burger.name);
  res.redirect("/burgers");
});

app.listen(3000, function () {
    console.log("WORKING");
});








