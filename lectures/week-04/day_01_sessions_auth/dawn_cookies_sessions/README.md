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

Next let's see if we `count` the number of times someone has come to the site.

```
var express = require("express");

var app = express();

app.get("/", function (req, res) {
  console.log(req.headers);
  var cookieStr = req.get("Cookie");
  var count = cookieStr ? parseInt(cookieStr.split("=")[1]) : 0;
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
