var REPL = require("repl");
var db = require("./models");

var repl = REPL.start("> ");
repl.context.db = db;

repl.on("exit", function () {
  console.log("Ciao");
  process.exit();
})
