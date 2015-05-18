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













