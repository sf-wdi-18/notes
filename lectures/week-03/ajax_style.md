# jQuery AJAX
## Style Guide


## Variable Naming

* It is best practice to either **prefix** or **postfix** variable names that refer to jQuery objects with a `$` symbol.

```javascript
var myTitle = $("h1#title"); // bad
var $myDiv = $("div#greeting"); // good;
var myTotal$ = $("div#total"); // okay
```

Note: don not go wild and just add `$` symbols to every variable

```javascript
var $myNum = 1; // bad
```

## Three Rules Of `$`

* If you give the `$` an HTML like string it will return a jQuery wrapped collection of elements that represent it.

```javascript
var $myDiv = $("<div>Hello World</div>");
```

That would be the equivalent of writing out something like the follwoing:

```javascript
var myDiv = document.createElement("div");
var innerText = document.createTextNode("Hello World");
myDiv.appendChild(innerText);
```
* If you give jQuery a **css selector** it will find it and return it as an object wrapped in jQuery.

```javascript
var $myDiv = $("div#greeting");
```

* If you give jQuery a `function () {}` it will run that function after `document` is ready.

```javascript
$(function () {
  console.log("DOCUMENT READY!");
});
```

Which is equivalent to the following:

```javascript
$(document).ready("ready", function () {
  console.log("DOCUMENT READY!");
});
```


## Events

When setting events you should use the `jQuery#on` method.


```javascript
var $myDiv = $("div#greeting");
$myDiv.on("click", function (e) {
  console.log("clicked");
});
```

Be sure to remember to `preventDefault()` for certain events


```javascript
var $articleForm = $("form#newArticle");
$articleForm.on("click", function (e) {
  e.preventDefault();
  console.log("The form was stopped!");
});
```

If you just have an `input` field not in a form you might listen for a `change` event.

```javascript
var $input = $("input#playerName");
$input.on("change", function (e) {
  var $this = $(this);
  var playerName = $this.val();
  console.log("Player name", playerName);
});
```

If you want to quickly gather all the input field name and value pairs from a form you should use `jQuery#serialize`


```javascript
var $newArticle = $("form#newArticle");
$newArticle.on("change", function (e) {
  var $this = $(this);
  console.log("Article info", $this.serialize());
});

```

### AJAX

If you can get away with using a jQuery helper method for AJAX please use it.

Doing a common `GET`

```javascript
$.get("/articles").
  done(function (data) {
    console.log(data);
  });
```

or a good ole `POST`

```javascript
$.post("/books", {
    book: {
      title: "The Giver",
      author: "Lowis Lowry"
    }
  }).
  .done(function (data) {
    console.log(data);
   });
```

then you should avoid the `jQuery#ajax` method. If you are doing something a little more interesting or needs more specificty that is not *a **GET** or **POST** type request with just a **data** and a **dataType** to expect back from the server.* Then you should look into using the `jQuery#ajax`.

```javascript

$.ajax({
  type: "PUT",
  url: "/books/1",
  data: {
          book: {
                  title: "The Giver",
                  author: "Lowis Lowry"
                }
        },
  dataType: "json"
}).done(function (data) {
  console.log("A book update", data);
});

```

### Event Delegation

If you are using jQuery to set events then you should consider using `jQuery#on` syntax and event delegation when possible.


Adding `click` handlers to each `tr` should be avoided.

```javascript

// bad
$("table#myTable tr").each(function (index, el) {
  $(el).on("click", function (e) {
    console.log("clicked tr", index);
  });
});
```

Add a `click` handler to the container of the collection.

```javascript
$("table#myTable").on("click", "tr", function (e) {
  console.log(this);
  console.log(e.target);
  console.log(e.currentTarget);
});

```

### Adding Data To Elements

You can add `data` to an element using `jQuery#data` method.

```javascript

var $myDiv = $("div#greeting");
$myDiv.data("count", 1);
$myDiv.data("count") // => 1
$myDiv.data(); // => { count: 1 }

```

Be sure to only remove elements from the DOM using jQuery though after you do this.

### Avoid Using `hide/show`

Just do not use these methods ever.

### Caching jQuery Objects

Just reuse the retrieved jQuery object.

```javascript

$("#books").addClass("read") // bad
$("#books").html("ALL READ") // bad

var $books = $("#books");
$books.addClass("read");
$books.html("ALL READ");

```















