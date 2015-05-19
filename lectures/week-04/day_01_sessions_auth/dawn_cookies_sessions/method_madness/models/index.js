var mongoose = require("mongoose");

mongoose.connect("mongodb://localhost/method_test");

// load in the book model
// ./ is the models direcotry 
var Book = require("./book");
var Author = require("./author");

// allow people to interact with
// the Book model we loaded
//  e.g.
//    var db = require("./models");
//    db.Book.create
module.exports.Book = Book;
module.exports.Author = Author;
