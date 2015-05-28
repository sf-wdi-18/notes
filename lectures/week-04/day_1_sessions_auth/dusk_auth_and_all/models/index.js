var mongoose = require("mongoose");
mongoose.connect("mongodb://localhost/methods");

var Book = require("./book");

module.exports.Book = Book;
