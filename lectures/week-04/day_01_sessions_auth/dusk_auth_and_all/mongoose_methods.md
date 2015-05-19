### Static and Instance Methods

Static methods exist on the class level of the model and is defined in the schema for each new model. For example, we can create a static method for our `User` that will create and obscure the User's password.

## Setup

Let's start by just creating a models folder.

```bash
mkdir method_madness
cd method_madness
mkdir models
touch models/book.js
touch models/author.js
touch models/index.js
```

Let's start by setting up the `index.js`.


```javascript
var mongoose = require("mongoose");

mongoose.connect("mongodb://localhost/method_test");

var Book = require("./book");
var Author = require("./author");

module.exports.Book = Book;
module.exports.Author = Author;

```

Then let's setup a Book model.

`models/book.js`

```javascript
var mongoose = require("mongoose");


var BookSchema = new mongoose.Schema({
    title: String,
    author: String,
    description: String
    });

var Book = mongoose.model("Book", BookSchema);

module.exports = Book;
```

We could verify that this works in the console.

```javascript
var db = require("./models");
db.Book.create({title: "The Giver"});
```

If you don't get an error then you're up and running.

Let's create an `authorSchema` for authors.


```javascript

var mongoose = require("mongoose");

var authorSchema = new mongoose.Schema({
  firstName: String,
  lastName: String,
  age: Number
});

var Author = mongoose.model("Author", authorSchema);
module.exports = Author;
```

The above should work as well. Let's add a super cool method to our `Author` called `csvCreate` that takes in a comma separated list of attributes and creates a `Author` from them.

```javascript
authorSchema.statics.csvCreate = function (csvStr, cb) {
  var attrs = csvStr.split(",");
  this.create({
    firstName: attrs[0],
    lastName: attrs[1],
    age: parseInt(attrs[2])
  }, cb);
}
```

Similarly, we can create helpful instance methods as well.

```javascript
authorSchema.methods.fullName = function () {
  return this.firstName + " " + this.lastName;
};
```

## Viewing Your Data

To view your data we want to try the following:

```
npm install mongo-express
```

and then set it up


```
mv node_modules/mongo-express/config.default.js node_modules/mongo-express/config.js
```

Now we edit the config file.


```
	useBasicAuth: false	

```


Then we run it to see our data


```
node node_modules/mongo-express/
```

