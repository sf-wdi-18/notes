#Express

##Objectives

* Initialize an express app *(~20m)*
* Pull information out of the req object *(~30m)*
* Build a calculator app *(~30m)*

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



##Foot Notes

#####Timing

* Intro 10m — pair programming guidelines
* Init app — 10m work & 5m discussion
* Req obj — 20m & 10m
* Break - 10m
* Cal app — 20m & 10m 

* 85m total

#####Framing

Frame that the last exercise may not be complete

##Ref
* [WDI 17](https://github.com/sf-wdi-17/notes/blob/master/lectures/week-03/_1_monday/dusk/README.md)
* [WDI 14](https://github.com/sf-wdi-14/notes/blob/master/lectures/week-3/_2_tuesday/dusk/introduction-to-express.md)
* [WDI Fall Dawn](https://github.com/wdi-sf-fall/notes/tree/master/week_03_intro_web_applications/day_01_intro_to_express/dawn_intro_express)
* [WDI Fall Dusk](https://github.com/wdi-sf-fall/notes/tree/master/week_03_intro_web_applications/day_01_intro_to_express/dusk_more_express)
* [Steps to create new express app](https://github.com/sf-wdi-17/notes/blob/master/reading/resources/steps_to_create_new_expressjs_app.md)