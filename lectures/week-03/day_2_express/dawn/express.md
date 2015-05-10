#Express

##Objectives

* Begin pair programming (*10m discussion*)
* Initialize an express app *(10m pairing, 5m discussion)*
* Pull information out of the req object *(20m pairing, 10m discussion)*
* Build a calculator app *(20m pairing, 10m discussion)*

##Goal
* Today we will be building a calculator web app. If we don't finish the whole exercise in class, that's OK, complete it for HW.

##Guidelines

###Workflow

* Stand-up-hand-up, head to another table, high-five someone and both put your hands down. You have a partner to **pair program** with!
* The person whose name is alphabetically first will be the first navigator.

###Pair programming

* Only one computer is used between two people. The person doing the coding is the **driver** the one spot checking & guiding is the **navigator**
* We will switch roles every **10m**.
* Switching roles will involve the driver pushing to Github and the navigator pulling down the changes.
  

##Project Initialization

#####Create a project directory
* `mkdir learningExpress` & `cd` into it
* touch `app.js`
* `npm init` and just press <enter> until it generates a `package.json` file for you
* Initialize git with `git init`
* Add & commit your changes

#####Initialize a Github repo
* Head to [GitHub](http://www.github.com) and click on the `+New repository` button
* Name the repo `ExpressCalculator`
* Check the box `Initialize this repository with a README`
* Add the preset `.gitignore` for Node

#####Add a collaborator
* In your new repo, click on `settings`
* In settings, navigate to the `collaborators` tab
* Search for your teammate's Github handle, to add them as a project collaborator

#####Link your local directory to your remote repo
* Point your local project repo to your remote Github repo with `git remote add origin <clone-url>`, replace with the actual `clone-url` of your project (it should end in .git)
*  Finally `git pull origin master` to merge changes locally
*  Git add, commit, and push to commit the entire repo to Github

##Using Express

#####Express
[Express](http://expressjs.com/) is a configurable, minimal web framework for Node.

#####Add express to your project

* `npm install express --save` adds Express to the project in a `node_modules` directory and saves it to the `package.json` file as a dependency.

#####Hello World App

* In `app.js` at the top of the file require express, call it and set the result equal to an `app` object that you can use to build your application.

```
var express = require('express');
var app = express();
```

* Next use this `app` object to define a route and the behavior that gets executed when a request comes in

```
// A "GET" request to "/" will run the function below
app.get('/', function(req,res) {
  // Send back the response 'Hello World'
  res.send("Hello World");
});
```
* Finally, tell the app to start listening for requests on port 3000 and console.log a message in the terminal to that regard

```
app.listen(3000);
console.log("listening on port 3000");
```

#####Run the server

* Test that it all works by running `node app.js` to start the application. Navigate to `localhost:3000` in your browser to see the "Hello World" message. Nice work!

---

##Requests

#####Custom routes

What if we want to create an app that can dynamically say hello to anyone?

* Using **url parameters** add a dynamic route to the application, indicated by `:someParam`.

```
app.get("/:name", function(req, res) {
  var name = req.params.name;  //access the name inside of `req.params`
  res.send("Hello " + name);
});
```
* The dynamic url parameters can now be accessed inside the request object, `req`.
* Check it's working by going to "/Jake" and seeing that it says "Hello Jake"

#####See it for yourself

We're going to use debug to pause our code and inspect the params.

* Place the keyword `debugger` in the route you just created

```
app.get("/:name", function(req, res) {
    debugger;
    var name = req.params.name;
    res.send("Hello " + name);
});
```

* Then run debug with `node debug app.js`
* This will pop you into line 1 of your code, hit `c` to continue
* Now your server is actively listening on port 3000
* In your browser make a request to the server by going to `/<yourName>`. KEEP IN MIND, your browser **will** hang; aka, the server will not respond to it. 
* Check your debug session. You should see the code paused on the line that says `debugger`. To enter into an interactive session type `repl`.
* Now in the repl check the value of `req.params.name`. Voila! It's there for you to see yourself!
* Try changing the value of `req.params`
* Exit out of `repl` back to debugger by hitting `<ctrl> + "C"` once
* Enter `c` again to let the function continue
* Checkout your browser window. Did the page adjust based on what you changed inside `req.params`?

---

##Build a Calculator

Let's build a calculator with our knowledge of express. Below you will find instructions on how to build a route that dynamically adds numbers together. We will be expanding the behavior of our application to include subtraction, addition, and multiplication.

#####Addition

* Let's create a function that will add two numbers as strings and sum them. It will be useful for this function to expect strings as inputs because our params will come into our application as strings.

```
var sum = function(num1, num2) { return parseInt(num1, 10) + parseInt(num2, 10) }
```


* Let's create a new route for our application that will simulate a calculator

```
//operation, num1, and num2 will all be parameters passed to the application by the user
app.get("/:operation/:num1/:num2", function(req, res) {
  var operation = req.params.operation;	//find specific param inside the req.params obj
  var num1 = req.params.num1;				//same as above
  var num2 = req.params.num2;
  var response = "The answer is: ";
  if (operation === "add") {
    response += sum(num1, num2);			//string concatenation
  } else {
    response = "Makes no sense. 404 >_<";	//404 message
  }
  res.send(response); 						//final server response
});
```

* KEEP IN MIND: If you make changes to your code you **must restart your server** before those changes will have any effect.

#####More Features!

* Now your turn, add the ability for the calculator to have the operations: subtraction, multiplication, and division.

#####Bonus

* Add a 4th parameter `:color` that changes the calculator's output to be whatever color the user input

---

##Continued learning
If you want to get a head start on future topics...

* [Express Docs](http://expressjs.com/api.html) — the reference guide for building express apps
* [`nodemon`](https://github.com/remy/nodemon) — nifty npm to incorporate code changes without manually restarting your server!