var mongoose = require("mongoose");

var authorSchema = new mongoose.Schema({
                      firstName: String,
                      lastName: String,
                      age: Number
                    });

// Author.csvCreate("jack,doe,13", func ..)
authorSchema.statics.csvCreate = function (csvStr, cb) {
  // "jack,doe,13" => {firstName: "jack" ... }
  var attrs = csvStr.split(",");
  this.create({
    firstName: attrs[0],
    lastName: attrs[1],
    age: parseInt(attrs[2])
  }, cb)
};



var Author = mongoose.model("Author", authorSchema);

module.exports = Author;





