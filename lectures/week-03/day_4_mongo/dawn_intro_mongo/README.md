# Intro Express
## Mongo CRUD


| Objective |
| :--- |
| To create a Schema and Model using mongoose |
| To explain and use CRUD operations on a single model | 


We want to get started **creating**, **reading**, **updating**, and **deleting** our own data, CRUD.

### Setup

First let's install `mongoose` in a new project folder.

```javascript
npm init
npm install --save mongoose
```

### Connecting

First make sure mongo is running. In a separate terminal window run.

```bash
mongod
```

Go into you node repl, just type `node` into bash. Let's require `mongoose` and connect to our databse. Mongoose will handle the create on connection.


```javascript

> var mongoose = require("mongoose");

> mongoose.connect("mongodb://localhost/test");

```

### Modeling

Let's create Book model. A Book has a few different characteristics: `title`, `author`,  and `description`.


```javascript

var BookSchema = new mongoose.Schema({
    title: String,
    author: String,
    description: String
});
```

and 

```javascript
var Book = mongoose.model('Book', BookSchema);

```


## Building and Creating

* If you want to **build up** a new Book you can just do the following:

  ```javascript
  var book = new Book({title: "Alice's Adventures In Wonderland"});
  ```

  Then you can play with it.

  ```javascript
  book.author = "Lewis Carroll";
  ```

  Once you're done you can save the book.

  ```javascript
  book.save()
  ```

  This is called **building** as you're playing with an object that will eventually be saved to the database, but doesn't yet exist in the DB.

* If you want to create a new Book, having it be saved to the DB immediately, then just use the `Book.create` method.


  ```javascript
  Book.create({title: "The Giver"}, function (err, book) {
    console.log(book);
  });

  ```

### Reading

**Reading** is the process of looking up data in our database.


* Let's find a `book` by it's id. 

  ```javascript
    Book.find({_id: '552a021a6d6f61d784de8994'}, function (err, book) {
      console.log(book)
    })
  ```

  * You can also use this to find all books by a certain author.

  ```javascript

    Book.find({author: "Lewis Carroll"}, function (err, books) {
      console.log(books);
    });
  ```

* Try out some of the other find methods.
  * `findOne`
  * `findById`

### Update and Delete

Similar to the above you methods you can both `update` and `delete` a record in your DB.

### Updating

* `update`
* `findByIdAndUpdate`


One interesting fact about Mongo is that you can update multiple things at one time.

```javascript

Book.update({author: "Lewis Carroll"}, {description: "Trippy!"}, function (err, numAffected, raw) {
  
  console.log(raw);
});

```

#### Removing

* `remove`
* `findByIdAndRemove`



### Static and Instance Methods

Static methods exist on the class level of the model and is defined in the schema for each new model. For example, we can create a static method for our `User` that will create and obscure the User's password.


```
userSchema.statics.createSecure = function (params, cb) {
	params.passwordDigest = "hashed text";
	this.create(params, cb);
})

var User = mongoose.model("User", userSchema);

User.createSecure({
	email: "foo@bar.com",
	password: "secret"
})

```

An instance method can also be helpful to avoid repeating logic associated to particular instances. 


```

userSchema.methods.checkPassword = function (pswrd) {
	return bcrypt.compareSync(password, this.passwordDigest);
}
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















