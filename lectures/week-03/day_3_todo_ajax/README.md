# More Express
## CRUD And AJAX

| Objectives |
| :---- |
| Review and apply `AJAX` requests with our **Express** application |
| Review and apply DOM manipulation techniques using jQuery. |
| Review CRUD in **Express** to send JSON responses to the server |

## Outline

We want to build a **TODO** application today.

[Something like this](http://todomvc.com/examples/jquery/#/all)


* Review related topics
* Setup Todo Application Directory
* Setup A Simple Hello World
  * Render A `home.html` file
  * Add `jQuery`
* Make a JSON `GET /todos` route
  * Use AJAX to get all `todos`.
* Make a JSON `POST /todos` route
  * Use AJAX to create new `todos`.

## Background

* [jQuery](https://github.com/sf-wdi-18/notes/blob/master/lectures/week-03/ajax_style.md)
* [jQuery DOM manipulation](https://github.com/sf-wdi-18/notes/tree/master/lectures/week-02/day_4_review/dawn_review)
* [jQuery Ajax](https://github.com/sf-wdi-18/notes/blob/master/lectures/week-03/ajax_style.md#ajax)


### Quick Questions

AJAX Related

* What does **AJAX** stand for?
  * Asynchronous JavaScript And XML
* What's the point of **AJAX**?
  * To make requests to a server to dynamically load content into the page or make changes on the server.
* What is `JSON`?
  * **JavaScript Object Notation**: it's just the representation of data using curlies and square brackets: arrays and objects.

Express Related

* What is a web application framework?
  * A library that helps interact with a server to setup easy ways to route request, setup middleware, etc.
* What is Express?
  * Express is a web application framework built to work with the built in Node HTTP server.
* What is Node.js?
  * Node.js or Node is a library that has bunch of utilities to not only allow us to run javascript, but also interact with our operating system and setup a server.

HTTP Related

* What is a `GET` type request?
* What is a `POST` tpe request?
* What is the main difference between the two?


## Getting Started

Let's setup your application directory:

```
mkdir todo_app
cd todo_app
touch index.js
mkdir views
```

Next initialize a *npm* project and install `express` and `body-parser`.

```
npm init
npm install --save express body-parser
```

Create a simple `index.js` file for your application.

`index.js`

```
var express = require("express"),
  bodyParser = require("body-parser"),
  path = require("path");

var app = express();

app.get("/", function (req, res) {
  res.send("Hello World");
});

app.listen(3000, function () {
  console.log("Running");
});
```


Make sure this much is running by going [localhost:3000](localhost:3000)


## Sending A File

Instead of sending a `Hello World` response. Let's instead send a `home.html` in our `views/` directory.

```bash
touch views/home.html
```

Let's add the usual boilerplate HTML.

```html

<!DOCTYPE html>
<html>
<head>
  <title>Todo App</title>
  </head>
  <body>
    Welcome!
  </body>
</html>
```

Let's add logic to our **root** route to send this file.

```
var views = path.join(process.cwd(), "views");

app.get("/", function (req, res) {
  var homePath = path.join(views, "home.html");
  res.sendFile(homePath);
});
```

Go to [localhost:3000](localhost:3000/) and verify it is working as expected.

## Adding Assets

We want to be able to use assets in our application, but we'll need a directory to put them in. Let's make some directories.

```bash
mkdir public
mkdir public/javascripts
mkdir public/stylesheets
mkdir public/images
```

Let's make a quick `app.css` file for your todo application.

`public/stylesheets/app.css`

```css
body {
  background-color: gray;
}
```

Then we want to let our application know about this new asset directory. Add the following to your `index.js`.


```javascript
app.use(express.static("public"))
```

Now we just need to add a **CSS** link in our `home.html`.

```html
  <link rel="stylesheet" type="text/css" href="/stylesheets/app.css">

```

Now we can test that this working by going to the [localhost:3000/](localhost:3000/).



## Adding jQuery

We want to be able to interact with jQuery on our `home.html` page. To do this we need to add a static asset server for jQuery.

```javascript
// so you can use public
app.use(express.static("public"));
// so you can use bower
app.use(express.static("bower_components"));
```

Next we want to actually install jQuery.

```bash
bower install jquery
```
and now we just need to add the `<script>` tag to our `home.html`.

```html
  <script type="text/javascript" src="/jquery/dist/jquery.js"></script>

```

### Thus Far

`views/home.html`

```
<!DOCTYPE html>
<html>
<head>
    <title>Todo App</title>
    <link rel="stylesheet" type="text/css" href="/stylesheets/app.css">
    <script type="text/javascript" src="/jquery/dist/jquery.js"></script>
  </head>
  <body>
    HELLO WORLD

  </body>
</html>
```


`index.js`

```
var express = require("express"),
  bodyParser = require("body-parser"),
  path = require("path");

var app = express();

app.use(express.static("public"));
app.use(express.static("public"));

var views = path.join(process.cwd(), "views");

app.get("/", function (req, res) {
  var homePath = path.join(views, "home.html");
  res.sendFile(homePath);
});

app.listen(3000, function () {
  console.log("Running");
});
```


If you're having problems with seting up Bower then you should use a CDN for the remainder of this project. However, you should verify that your **CSS** is working before continueing.

### Client Side JS

We want to create an `public/javascripts/app.js` file that will have a majority of our application logic. Let's do that.

```bash
touch public/javascripts/app.js
```

And let's add some test code inside.

`public/javascripts/app.js`

```javascript
$(function () {
  alert("The Page Has Loaded!");
});
```

Now we just need to make sure it properly linked with a script tag.

`views/home.html`

```html
<script type="text/javascript" src="javascripts/app.js"></script>
```

**NOTE**: make sure your script tag above is below where you put jQuery.


## Reading Todos

* **Our first goal is to have `todos` on the server that we can render on the client side**

Let's add a `todos` array in our `index.js` with some example todo objects.

`index.js`

```javascript

var todos = [
              {
                title: "Finish Laundry",
                description: "two loads left"
              },
              {
                title: "Go To Gym",
                description: "Leg Day"
              }
            ];

```


Now let's add a route to send all the todos when requested.

`index.js`

```javascript
app.get("/todos", function (req, res) {
  res.send(todos);
});
```


Go to [/todos](localhost:3000/todos) to view all todos.


### Using AJAX

We now have a route to send all `todos` it's just a matter of adding jQuery to our `javascripts/app.js` that will make a request to our server to grab them.


`public/javascripts/app.js`

```javascript
$(function () {
  $.get("/todos").
    done(function (data) {
      console.log("RECEIVING RESPONSE");
      console.log("DATA", data);
    })
});
```

You should see `todos` logged in your dev console in the browser.


### Appending The Todos

Let's go through `each` todo in the `data` and `append` them to the page.

`public/javascripts/app.js`

```javascript
$(function () {
  $.get("/todos").
    done(function (data) {
      console.log("RECEIVING RESPONSE");
      console.log("DATA", data);
      $(data).each(function (index, todo) {
        var $todo = $("<div>" + todo.title + "</div>");
        $("body").append($todo);
      });
    });
});

```

We should now see todos on the page.

## Exercises

* Add a `div` to the `views/home.html` with class `todosCon` -- a todos container. Then `append` each `todo` to it.

* Before you `append` each new `todo` to the page give it a class of `todo`.

* Add some css for a the class `todo` in your `app.css`. Give each `todo` a border of `1px`.


## Making Todos

* **Our goal now that is to now be able to send `POST` requests to our server to add new todos, and then add them to the page**


First we will need to add a trust form to our `views/home.html`

```html
<form id="newTodo">
  <input type="text" name="todo[title]">
  <textarea name="todo[description]"></textarea>
  <button>Save Todo</button>
</form>

```

**NOTE**: we don't care about the `action` and `method` for this form because we are going to use jQuery to submit it.

Let's add some javascript to listen for the form to submit.

```javascript

  $("#newTodo").on("sumbit", function (e) {
    var $this = $(this);
    var formData = $this.serialize();
    console.log(formData);
    $.post("/todos", formData).
      done(function (data) {
        console.log("Success!");
      });
  });

```

However, keep in mind that we don't yet have a route on the backend to receive this post. 





















