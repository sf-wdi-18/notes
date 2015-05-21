# Sessions Review
## Library Style App

| Objectives |
| :--- |
| To review and apply sessions to application with one relationship |
| To handle routing for muliple resources and pages |
| To implement **sign up**, **sign in**, and **logout** features |




## Setting Up

To practice sessions and managing resources we will create a **book style** application, **THE LIBRARY APP**. 


Let's get started setting up our standard application structure.


```bash

mkdir library_app;
cd library_app;

touch index.js;
echo {} > package.json;

mkdir -p public/{javascripts,stylesheets,images};

mkdir views;
touch views/home.html

mkdir models;
touch models/{index.js,book.js,user.js};

bower init
bower install --save jquery
```

You should have some idea of why each of these groups of directories and files are being created. Take a second to discuss it.


* `library_app/` **is our root app dir**
  * `index.js` **the main application file`.**
  * `public/` **the assets directory for the application**
    * `javascripts/`, `stylesheets/`, etc are all assets.
  * `views` **contains all the html files we will send to the client**. You can optionally add subfolders here to break up the `views` into different concerns like `views/users/`, `views/books`, `views/sessions`, etc.
  * `models/`, **contains all our application model logic that we use to interact with our DB**.
  * `bower_components` **is an optional directory that we have only because we are using `bower`.**


## A Basic App

Let's create a basic `home.html` page in our `views/`


`views/home.html`

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Lib App</title>
  </head>
  <body>
    <h2>Welcome</h2>
  </body>
</html>
```

Now we should install `express` and get a basic application file up and running. Then let's setup our application `index.js` to use the `home.html` in our root route.

```bash
npm install --save express body-parser
```


`index.js`

```javascript
var express = require("express"),
    bodyParser = require("body-parser"),
    path = require("path");

var app = express();
app.use(bodyParser.urlencoded({extended: true }));

var views = path.join(__dirname, "views");

app.get("/", function (req, res) {
  var homePath = path.join(views, "home.html");
  res.sendFile(homePath);
});

app.listen(3000, function () {
  console.log("Running!");
})
```

Just check that it's working correctly on [localhost:3000/](localhost:3000/).


## Adding models

Let's create a simple user model.

First install `mongoose`.

```bash
npm install --save mongoose
```

Then setup up your `user.js`.


`models/user.js`

```javascript

var mongoose = require("mongoose");

var userSchema = new mongoose.Schema({
                  email: {
                    type: String,
                    lowercase: true,
                    required: true,
                    index: {
                      unique: true
                    }
                  },
                  passwordDigest: {
                    type: String,
                    required: true
                  },
                  first_name: {
                    type: String,
                    default: ""
                  },
                  last_name: {
                    type: String,
                    default: ""
                  }
                });


var User = mongoose.model("User", userSchema);

module.exports = User;

```

see [required](http://mongoosejs.com/docs/api.html#schematype_SchemaType-required), [unique](http://mongoosejs.com/docs/api.html#schematype_SchemaType-unique)


see also [terminology in mongo](http://docs.mongodb.org/manual/reference/glossary/#term-document)


Then setup the models `index` file to connect to our DB.


```javascript

var mongoose = require("mongoose");
mongoose.connect("mongodb://localhost/library_app");

module.exports.User = require("./user");

module.exports.Book = require("./book");


```


You should then verify that you can create a `User` model in the node console.


```bash
var db = require("./models")
db.User.create({
    email: "foo",
    passwordDigest: "foo"
}, function (err, user) {
  console.log(user);
});

```

That should work. Otherwise, you should begin meticulously debugging.

### createSecure

Let's add a `statics` method for securely creating a user using `bcrypt` to encrypt a new users password.


```bash
npm install --save bcrypt

```

```javascript

var bcrypt = require("bcrypt");

var confirm = function (pswrd, pswrdCon) {
  return pswrd === pswrdCon;
};

userSchema.statics.createSecure = function (params, cb) {
  var isConfirmed;
  
  isConfirmed = confirm(params.password, params.password_confirmation);

  if (!isConfirmed) {
    return cb("Passwords Should Match", null);
  }

  var that = this;

  bcrypt.hash(params.password, 12, function (err, hash) {
    params.passwordDigest = hash;
    that.create(params, cb);
  });

};

```

Then we want to use the `createSecure` **static method** to add `Users` to our application.

**NOTE**: you could save some backend time here and user frustration by doing validations on the frontend also.

## User Sign Up

Then we can add a User sign up page.


```bash
touch views/signup.html
```

After we create the `signup.html` we should add a form.

`signup.html`

```html

<form method="POST" action="/users">
  <div>
    <input type="text" name="user[email]">
  </div>
  <div>
    <input type="password" name="user[password]">
  </div>
  <div>
    <input type="password" name="user[password_confirmation]">
  </div>
  <button>Sign Up</button>
</form>
```

**NOTE**: the **method** and **action** match the name of the route we need to create after we finish with this route.

`index.js`

```javascript

app.get("/signup", function (req, res) {
  var signupPath = path.join(views, "signup.html");
  res.sendFile(signupPath);
});

```


Now we can also make a route to recieve the post from the signup page. However, before we can do that we need to require our `./models` directory.

`index.js`

```javascript
var db = require("./models");
```

`index.js`

```javascript
app.post("/users", function (req, res) {
  var newUser = req.body.user;
  db.User.
  createSecure(newUser, function (err, user) {
    if (user) {
      res.send(user);
    } else {
      res.redirect("/signup");
    }
  });
});
```


## Authenticate

When we go to authenticate a User we want to both verify their email and password combination matches our DB and then log them in. That means we are getting close to implementing sessions.


`models/user.js`

```javascript

userSchema.statics.authenticate = function (params, cb) {
  this.findOne({
      email: params.email
    },
    function (err, user) {
      bcrypt.compare(params.password, 
      user.passwordDigest, function (err, isMatch) {
        if (isMatch) {
          cb(null, user);
        } else {
          cb("OOPS", null);
        }
      })
    });
};

```


We could clean this code up though. Let's make a method on the instance to allow us to check the password.


```javascript

userSchema.statics.authenticate = function (params, cb) {
  this.findOne({
      email: params.email
    },
    function (err, user) {
      user.checkPswrd(params.password, cb);
    });
};

userSchema.methods.checkPswrd = function(password, cb) {
  var user = this;
  bcrypt.compare(password, 
  this.passwordDigest, function (err, isMatch) {
    if (isMatch) {
      cb(null, user);
    } else {
      cb("OOPS", null);
    }
  });
};
```


### Exercise

* Validate that it works.

------


Now that we have an authenticate method let's make a login page work.

`views/login.html`

```html

<form method="POST" action="/login">
  <div>
    <input type="text" name="user[email]">
  </div>
  <div>
    <input type="password" name="user[password]">
  </div>
  <button>Sign Up</button>
</form>
```

And looking at the above `method` and `action` we can start to guess what we'll be working on next.

`index.js`

```javascript
app.get("/login", function (req, res) {
  var loginPath = path.join(views, "login.html");

  res.sendFile(loginPath);
})

```

Then as we noted earlier we need a place to submit this form.

`index.js`

```javascript

app.post("/login", function (req, res) {
  var user = req.body.user;

  db.User.
  authenticate(user,
  function (err, user) {
    if (!err) {
      res.redirect("/profile");
    } else {
      res.redirect("/login");
    }
  })
});

```

**WE DON'T HAVE A PROFILE PAGE YET**


```javascript

app.get("/profile", function (req, res) {
  res.send("COMING SOON");
});

```

## Adding Sessions

Now, there's a problem with everything we've done. **WE'VE LEFT OUT SESSIONS**. Let's get those started.


```bash
npm install --save express-session
```

Then get it setup quickly.


`index.js`

```javascript
// add this to requires
var session = require("express-session");

// somewhere
app.use(session({
  secret: "SUPER STUFF",
  resave: false,
  saveUninitialized: true
}));
```

Then we want to create our own little middle-ware for express.

`index.js`

```javascript

var loginHelpers = function (req, res, next) {

  req.login = function (user) {
    req.session.userId = user._id;
    req.user = user;
    return user;
  };

  req.logout = function () {
    req.session.userId = null;
    req.user  = null;
  };

  req.currentUser = function (cb) {
    var userId = req.session.userId;
    db.User.
      findOne({
        _id: userId
      }, cb);
  };

  // careful to have this
  next(); // real important
};

app.use(loginHelpers)
```

Then we have to go back through our routes to actually `login` users.

`index.js`

```javascript
app.post("/users", function (req, res) {
  var newUser = req.body.user;
  db.User.
  createSecure(newUser, function (err, user) {
    if (user) {
      req.login(user); // <--- see here
      res.redirect("/profile"); // <--- also here
    } else {
      res.redirect("/signup");
    }
  });
});
```
Let's do the same for the `login`.

`index.js`

```javascript

app.post("/login", function (req, res) {
  var user = req.body.user;

  db.User.
  authenticate(user,
  function (err, user) {
    if (!err) {
      req.login(user); // <--- login
      res.redirect("/profile");
    } else {
      res.redirect("/login");
    }
  })
});

```

If you users can login then they should also have a `logout` route.

`index.js`

```javascript

app.get("/logout", function (req, res) {
  req.logout();
  res.redirect("/");
});

```

However, now we should also make sure our `profile` page shows something about our user.


```javascript

app.get("/profile", function (req, res) {
  req.currentUser(function (err, user) {
    if (!err) {
      res.send(user.email);
    } else {
      res.redirect("/login");
    }
  });
});

```

### Exercise 

* Add a real `profile.html` page that users can view.


