var mongoose = require("mongoose");

var bookSchema = new mongoose.Schema({
  title: String
});

module.exports = mongoose.model("Book", bookSchema);
