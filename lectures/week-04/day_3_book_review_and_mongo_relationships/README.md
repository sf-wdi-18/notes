# Review
## Book App

| Objectives |
| :---- |
| REVIEW ALL THE THINGS! |

## Setting Up

Let's setup a typical project directory

```bash
mkdir book_app
cd book_app
mkdir views
mkdir public
mkdir public/stylesheets
mkdir public/javascripts
touch index.js
touch views/home.html
mkdir models
touch models/index.js
echo {} > package.json
```

Let's also get started with a usual `index.js` file.

First install the usual module.

```bash
npm install --save express body-parser
```

`index.js`

```javascript
var express = require("express"),
    bodyParser = require("body-parser"),
    path = require("path");

var app = express(),
    views = path.join(__dirname, "views");

app.use(bodyParser.urlencoded({extended: true}));

app.get("/", function (req, res) {
  var homePath = path.join(views, "home.html");
  res.sendFile(homePath);
});

app.listen(3000, function () {
  console.log("STARTING");
});
```

Let's also create basic `views/home.html`.


```html
<!DOCTYPE html>
<html>
  <head>
    <title></title>
  </head>
  <body>
    <h1>Book App</h1>
  </body>
</html>
```

## A Book Model

Next we should add a `Book` model. Then we can start building out CRUD for our application.

Let's install `mongoose`.

```bash
npm install --save mongoose
```

`models/book.js`


```javascript

var mongoose = require("mongoose");

var bookSchema = new mongoose.Schema({
                    title: String,
                    author: String,
                    description: String
                  });


var Book = mongoose.model("Book", bookSchema);

module.exports = Book;
```

Then we need to update our `models/index.js` to reflect the new model we added.

`models/index.js`

```javascript
var mongoose = require("mongoose");
mongoose.connect("mongodb://localhost/book_app");

module.exports.Book = require("./book");
```

This allows us to be able to both connect to our `book_app` database. Then it includes `Book` as part of the `db` module, used later.

Before we add `models` to our application `index.js` we should test that it works correctly in the node console.

```javascript
> var db = require("./models");
> db.Book.
    create({
      title: "Proofs From The Book"
    }, function (err, book) {
        console.log(book);
    });
```

If we are able to successfully create a book then we can move on and add `models` to our `index.js`.

`index.js`

```javascript

var express = require("express"),
    bodyParser = require("body-parser"),
    path = require("path"),
    db = require("./models"); // adding models

```


## Getting All Books

Let's build a route to be able to get all of our `books`, so that we can render them to the page.

```javascript

app.get("/books", function (req, res) {
  db.Book.find({},
    function (err, books) {
      res.send(books);
    });
});
```

We should've created at least one book at this point so we can  view it by starting up our application and `curl`-ing the `/books` route.

```bash
curl localhost:3000/books
```

All together our application js file looks like the following:

```javascript

var express = require("express"),
    bodyParser = require("body-parser"),
    path = require("path"),
    db = require("./models");

var app = express(),
    views = path.join(__dirname, "views");

app.use(bodyParser.urlencoded({extended: true}));

app.get("/", function (req, res) {
  var homePath = path.join(views, "home.html");
  res.sendFile(homePath);
});

app.get("/books", function (req, res) {
  db.Book.
    find({}, function (err, books) {
      res.send(books);
    });
});

app.listen(3000, function () {
  console.log("STARTING");
});

```

## Adding jQuery

Now that we have a home page and we are able to interact with our `Book` model we should try to render each book to the page.

```bash
bower init
bower install --save jquery
```

This will create a `bower_components` directory that we want to serve to the client using a `express.static`. We should also add the `public` folder to our static assets.

`index.js`

```javascript
// tell our application what our
//  assets are
app.use(express.static("bower_components"));
app.use(express.static("public"));
```

Then what we want to do is add a `script` tag to our `views/home.html` that links to `jquery`.


`views/home.html`

```html
...
  <script src="/jquery/dist/jquery.js"></script>
...
```

Then we want to create an `app.js` in the `public/javascripts` directory.

```bash
touch public/javascripts/app.js

```

`public/javascripts/app.js`

```javascript
// wait for the
// document to be ready
$(function () {
  console.log("READY!");
});
```

Then we just need to add a `script` tag for our `app.js` to our `home.html`

```javascripts

<script src="/javascripts/app.js"></script>
```

Now let's actually write some code to fetch all the `Book` models.


```javascript
$.get("/books").
  done(function (data) {
    console.log(data);
  });

```

Then we can add a container to our page to append all of our books.

```html
<div id="booksCon">
</div>
```

Now we can update our `$.get` to also append to the page.

```javascript

var $booksCon = $("#booksCon");
$.get("/books").
  done(function (data) {
    console.log(data);
    $(data).each(function (index, book) {
      $booksCon.append("<div>" + book.title + "</div>");
    });
  });

```

## Better Templates (Underscore)

Let's get some better templating going on in our application to avoid string concatenation.


```bash
bower install underscore
```

Then add a script tag to our `home.html`.


```html
<script type="text/template" id="bookTemp">
  <div class="book">
    <h2><%= title %></h2>
  </div>
</script>
```

Now we can modify our `javascripts/app.js` to utilize this template.


```javascript
var $booksCon = $("#booksCon");
var bookHTML = $("#bookTemp").html();
var bookTemp = _.template(bookHTML);
$.get("/books").
  done(function (data) {
    console.log(data);
    $(data).each(function (index, book) {
      var $book = $(bookTemp(book));
      $booksCon.append($book);
    });
  });


```


