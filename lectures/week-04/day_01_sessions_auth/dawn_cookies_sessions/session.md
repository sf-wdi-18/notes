# More Express
## Cookies And Sessions

| Objectives |
| :---- |
| Review the request and response cycle and the stateless web |
| Dicuss and use a cookie in a web application |
| Implement Sessions and review the concept of middleware. |

# A Simple Setup

Let's get going.

```bash
mkdir cookie_example;
cd cookie_example;
touch index.js;
echo '{}' > package.json;
npm install --save express;
```


And create a boiler plate Express app.

```javascript

var express = require("express");

var app = express();

app.get("/", function (req, res) {
  res.send("Hello World");
});

app.listen(3000, function () {
  console.log("UP AND RUNNING");
});
```

## Cookies

Let's take a look at how we can set a cookie and then we'll talk about it's utility.

```javascript

var express = require("express");

var app = express();

app.get("/", function (req, res) {
  res.set({
    "Set-Cookie": "count=1"
  });
  res.send("Hello World");
});

app.listen(3000, function () {
  console.log("UP AND RUNNING");
});

```

This sends a response that looks something like the following:

```
HTTP/1.1 200 OK
X-Powered-By: Express
Set-Cookie: count=1
Content-Type: text/html; charset=utf-8
Content-Length: 11
ETag: W/"b-4a17b156"
Date: Mon, 18 May 2015 07:36:50 GMT
Connection: keep-alive

Hello World
```

The browser then saves that cookie, which you can then view in **Chrome** under resources for localhost:3000.

The next time you visit the site you send request with the following in the headers.

```
...
  cookie: 'count=1',
...
```

Let's see if we `count` the number of times someone has come to the site.

```
var express = require("express");

var app = express();

app.get("/", function (req, res) {
  console.log(req.headers);
  var cookieStr = req.get("Cookie");
  var count = 0;
  if (cookieStr ) {
    count = parseInt(cookieStr.split("=")[1]);
  }
  count += 1;
  res.set({
    "Set-Cookie": "count=" + count
  });
  res.send("Hello World");
});

app.listen(3000, function () {
  console.log("UP AND RUNNING");
});


```

Express also has a built in method called `res.cookie` to make writing cookies easier.


```javascript

var express = require("express");

var app = express();

app.get("/", function (req, res) {
  console.log(req.headers);
  var cookieStr = req.get("Cookie");
  var count = 0;
  if (cookieStr ) {
    count = parseInt(cookieStr.split("=")[1]);
  }
  count += 1;
  res.cookie('count', count);
  res.send("Hello World");
});

app.listen(3000, function () {
  console.log("UP AND RUNNING");
});
```

**Note**: cookies that don't have expiration dates are considered to be session cookies and are deleted after the browser is closed.

If we want to manipulate cookies we should problem do a better job of parsing them.

```bash
npm install --save cookie-parser

```
And now we just tell our app to use it.

```javascript
var express      = require('express');
var cookieParser = require('cookie-parser');

var app = express();
app.use(cookieParser());

```

Then we can rewrite our above example.


```javascript


app.get("/", function (req, res) {
  console.log(req.cookies);
  var count = parseInt(req.cookies.count)
  res.cookie('count', count);
  res.send("Hello World");
});


```


All together we have the following:


```javascript

var express      = require('express');
var cookieParser = require('cookie-parser');

var app = express();
app.use(cookieParser());

app.get("/", function (req, res) {
  console.log(req.cookies);
  var count = parseInt(req.cookies.count)
  res.cookie('count', count);
  res.send("Hello World");
});

app.listen(3000, function () {
  console.log("UP AND RUNNING");
});
```


## Sessions

What if instead of storing all the information in a cookie we give each new session a **globally unique id** or **guid** and just store things in an object associated to that **guid**.


```javascript



var express      = require('express');
var cookieParser = require('cookie-parser');

var app = express();
app.use(cookieParser());

var sessions = {};
var guid = 0;

app.get("/", function (req, res) {
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
  sessions[userGuid].count += 1;
  res.send("Hello World " + sessions[userGuid].count);
});

app.listen(3000, function () {
  console.log("UP AND RUNNING");
});

```


In reality we would want to do this for multiple routes so this might need to become middleware.

```javascript


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

```


Then what we could do is just have the following code.


```javascript


app.get("/", function (req, res) {
  req.session.count += 1;
  var count = req.session.count;
  res.send("Hello World " + count);
});

```

And all of the following:


```javascript
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

```

Now this is not sufficient for what we want to do so we will see something called `express-session` later that works much better for a production application.

























