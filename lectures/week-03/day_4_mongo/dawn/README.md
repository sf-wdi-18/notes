#The Wonderful World of Mongo(ose)

##Learning Objectives

|By the end of this lesson, you should be able to...|
| :--- |
| Compare and contrast SQL with a noSQL database, such as MongoDB |
| Create Schemas and Models using mongoose |
| Perform Read & Write operations on a model |
| Forge relationships between models|

###Terminology

* Schema
* Object-relational mapping (ORM)

##Install Party

### [Homebrew](http://brew.sh/)

One of the tools we're going to need today is called Homebrew. We can use it to quickly install other libraries that we'll need. It is a version control manager for 

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

While you wait, indulge in some Homebrew [history](http://en.wikipedia.org/wiki/Homebrew_Computer_Club)

### [MongoDB](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-os-x/)

We will also want to install MongoDB, a popular noSQL database. 

* First we'll need to run brew update to update our brew packages.

  ```bash
  brew update
  ```
* Next we'll need to run `brew install` for **MongoDB**

  ```bash
  brew install mongodb
  ```

* Then we'll need a directory for **MongoDB** to save data.

  ```bash
  sudo mkdir -p /data/db
  ```

  * Finally we'll want to make sure we have permission to read and write to this directory.

  ```bash
  sudo chown -R $USER /data/db
  ```
  
## Concepts

A **RDBMS** is a relational database management system.

**NoSQL** relies on storage of key value pairs; similar to a JavaScript object.

![](http://smartdatacollective.com/sites/smartdatacollective.com/files/RDBMSvsNoSQL.jpeg)
####An analogy of RDBMS vs NoSQL

NoSQL databases store information like you would recipes in a book. When you want to know how to make a cake, you go to that recipe, and all of the information about how to make that cake (ingredients, preparation, mixing, baking, finishing, etc.) are all on that one page.

SQL is like shopping for the ingredients for the recipe. In order to get all of your ingredients into your cart, you have to go to many different aisles to get each ingredient. When you are done shopping, your grocery cart will be full of all the ingredients you had to run around and collect.

Wouldn’t it be nicer if there was a store was organized by recipe, so you could go to one place in the store and grab everything you need from that one spot? Granted you’ll find ingredients like eggs in 50 different places, so there’s a bit of overhead when stocking the shelves, but from a consumer standpoint it was much easier/faster to find what they were looking for.

[mgoffin/Stack Overflow](http://stackoverflow.com/questions/14428069/sql-and-nosql-analogy-for-the-non-technical/14428221#14428221)

## Setup

### Requirements

First let's install `mongoose` in a new project folder. Mongoose is a **Object-relational mapping** middleware that enables us to easily model objects and interact with MongoDB.

```javascript
npm init
npm install --save mongoose
```

### Connecting

First make sure mongo is running. In a separate terminal window run.

```bash
mongod
```

Go into your node repl, by typing `node` into bash. 

Let's require `mongoose` and connect to our database.


```javascript
var mongoose = require("mongoose");
mongoose.connect("mongodb://localhost/test");
```

*Pro Tip: press tab in node to see all global variables*

## Modeling

Let's create Book model. A Book has a few different characteristics: `title`, `author`,  and `description`.

To create a Book model we have to use a Schema, which is ver similar to a constructor, in that it acts as the blueprint for which all new books will reference.


```javascript
var Schema = mongoose.Schema;
var BookSchema = new Schema({
    title: String,
    author: String,
    description: String
});
```

and finally create the model

```javascript
var Book = mongoose.model('Book', BookSchema);
```

For [reference](http://mongoosejs.com/docs/schematypes.html) here are the different datatypes you can use in your Schema


## Building and Creating Documents

A MongoDB **Document** is the entry of of data stored in MongoDB; Documents are analogous to JSON objects but exist in the database in a more type-rich format known as BSON (binary-JSON).

* If you want to **build up** a new Book you can just do the following:

  ```javascript
  var book = new Book({title: "Alice's Adventures In Wonderland"});
  ```

  Then you can play with it.

  ```javascript
  book.author = "Lewis Carroll";
  ```
  
  
  This is called **building** as you're playing with an object that can be saved to the database, but doesn't exist there yet.

  Once you're done building you can `save` the book.

  ```javascript
  book.save()
  ```


* If you want to build & save in one step you can use `create`.

  ```javascript
  Book.create({title: "The Giver"}, function (err, book) {
    console.log(book);
  });
  ```
  
### Removing

* `remove`
* `findByIdAndRemove`
  
## Reading


* Let's find a `book` by it's author.

  ```javascript
    Book.find({author: "Lewis Carroll"}, function (err, books) {
      console.log(books);
    });
  ```

* Try out some of the other find methods.
  * `findOne`
  * `findById`


* Reference the docs for more info on what you can do with Mongoose [Models](http://mongoosejs.com/docs/api.html#model_Model.findById)

## Storing a Query Object

We can `console.log` all books as follows:

```javascript
Book.find({}, function(err, books){
  console.log(books);
});
```
or we can avoid passing in a callback to our query and store it for later...

```javascript
var query = Book.find({});
query.exec(function(err, books){
  console.log(books);
});
```

## Organizing the Data

### Document Structure

**Embedded Data**

![](http://docs.mongodb.org/manual/_images/data-model-denormalized.png)


**Data References**

![](http://docs.mongodb.org/manual/_images/data-model-normalized.png)


## Embedded Data

* Let's make a new `Author` schema with the attributes
	* `name` that will be a String
	* `books` that will contain an array of Books the Author has written 

* Define the Author schema

```javascript
var AuthorSchema = new Schema({
  name: String,
  books: [BookSchema]
});
```
* Turn the schema into a model

```
var Author = mongoose.model('Author', AuthorSchema);
```

* Let's make an author
```javascript
var homer = new Author();
```

* Create some books

```javascript
var theIliad = new Book({title: 'The Iliad'});
var theOdyssey = new Book({title: 'The Odyssey'});
```

* Associate the books with that Author and check the result

```javascript
homer.books.push(theIliad, theOdyssey);
homer.books;
```

* Note: Since the books are stored *inside* the associated Author, we can remove the Book's property `author`

Wooooo NICE JOB!

## Further learning

* [MongoDB Manual](http://docs.mongodb.org/manual/)
* [Mongoose guide](http://mongoosejs.com/docs/guide.html)
