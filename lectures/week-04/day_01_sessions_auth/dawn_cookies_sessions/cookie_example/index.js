var express      = require('express');
var cookieParser = require('cookie-parser');

var app = express();
app.use(cookieParser());

var sessions = {};
var guid = 0;

var checkGuid = function (req, res, next) {
  var userGuid = req.cookies.guid;
  console.log(req.cookies.guid)
  if (!userGuid) {
    guid += 1;
    userGuid = guid;
    sessions[guid] = {
                        count: 0
                      };
    res.cookie("guid", userGuid);
  }

  req.session = sessions[userGuid];
  next();
}

app.use(checkGuid);

app.get("/", function (req, res) {
  req.session.count += 1;
  var count = req.session.count;
  res.send("Hello World " + count);
});

app.listen(3000, function () {
  console.log("UP AND RUNNING");
});


