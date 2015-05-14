# Todo Refactor
## Adding Mongo

| Objective |
| :----- |
| Take an existing application and review CRUD |
| Review Mongoose CRUD operations |
| Apply Mongoose CRUD to an existing in memory application to add persistence |

## Getting Started

Use the following directions

* `git clone` this repo
* `npm run setup`
* `npm run start`

Take a few minustes to review the application.

## Reviewing

Let's make a `models` file. This file will store all of our model definitions. Later we will have to separate this into multiple files.

```
touch models.js
```

And let's define our `Todo` model inside of it.


```javascript
var mongoose = require("mongoose");
mongoose.connect("mongodb://localhost/todos_app");

```

However these three lines assume we already have `mongoose` already installed. We should install it before we forget. It's hard to remember what you need to install before you need it, but once you realize you do, then you should take that opportunity to do it.

```bash
npm install --save mongoose
```


Great! We can now define our `Todo` Schema.


```javascript

var mongoose = require("mongoose");
mongoose.connect("mongodb://localhost/todos_app");

var todoSchema = new mongoose.Schema({
  title: {
    type: String,
    default: ""
  },
  description: {
    type: String,
    default: ""
  },
  completed: {
    type: Boolean,
    default: false
  }
});

var Todo = mongoose.model("Todo", todoSchema);

module.exports.Todo = Todo;
```

Note that the last step will allow us to interact with the `Todo` model when we require this file later. Let's see that this works.

Go into the node repl.


```
var db = require("./models");

db.Todo.create({
  title: "DO LAUNDRY",
  description: "Two loads!"
}, function (err, todo) {
  console.log("TODO CREATED");
  console.log(todo);
});
```

It can be hard to do this every time you go into Node, so I make a little `console.js` file that does this for me.

`console.js`

```javascript
var REPL = require("repl");
var db = require("./models");

varrepl = REPL.start("Todo > ");
repl.context.db = db;

repl.on("exit", function () {
  console.log("GOODBYE!!");
  process.exit();
});
```

We can then run this using 

```bash
node console.js
```

## Refactoring

Let's add our `models.js` file to our application, `index.js`.


```javascript

var db = require("./models");

```

Then let's refactor `GET /todos`

```javascript
app.get("/todos", function (req, res) {
  db.Todo.find({},
    function (err, todos) {
      res.send(todos);
    });
});
```

Then go to localhost:3000 to verify this is working.

### CREATING

Let's now refactor our `POST /todos`.

```javascript

app.post("/todos", function (req, res) {
  db.Todo.create(req.body.todo, 
    function (err, todo) {
      res.send(201, todo);
    });
});

```

### Removing

Let refactor the delete method


```javascript
app.delete("/todos/:id", function (req, res) {
  db.Todo.findAndRemove({
    _id: req.params.id
  }, function (err, todo) {
    res.send(204) // success No Content
  });
});
```

### Clean Up

Delete the old `todos` array. It's not needed. :D

* Go through all the `public/javascripts/app.js` code and change everywhere you see `index` to `_id`. Good luck! Yikes!!!!

























