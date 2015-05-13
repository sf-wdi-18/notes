# Intro to Web Frameworks: Express.js
## Routes, Params, and Queries

| Objectives |
| :---- |
| Review and discuss the request and response cycle |
| Describe the parts of an HTTP request and url  |
| Apply routing knowledge to build an express application |

## Pre-reading

* [HTTP Intro](http://code.tutsplus.com/tutorials/http-the-protocol-every-web-developer-must-know-part-1--net-31177)

## Terminology

* HTTP
* TCP
* Resource path
* Query string
* HTTP verb
* Status code
* Network packet
* W3C

## Outline

* Intro to Express
	* A Hello World App
* Routing
	* HTTP GET  
	* Request Params
* Query Params
* Calculator App

##Express Intro (15m)

**Background**

* We already know that [Node.js](https://github.com/sf-wdi-18/notes/blob/master/lectures/week-02/day_3_node/dawn/node-intro.md)
	* **is a tool to run JavaScript outside the browser, directly on your OS.**
* But what is a *web application framework*?
	* **A tool for handling middleware integration, routing, and other relevant concerns.**
* How about [Express](http://expressjs.com/)?
	* **A configurable, minimal web framework for Node.**

###Setup

Let's start with a simple **Express** application.

* Make a directory and `index.js`  
	
	```
	mkdir quick_example
	cd quick_example/
	touch index.js
	```

* Then create a `package.json`, use the first line below or `npm init`.

	```
	echo {} > package.json		#puts an empty object into a new `package.json`
	npm install --save express
	subl .
	```
The folder structure will be as follows:
<img src="folders.png" style="width:500px;">


Now we need write some code for our simple application.


`index.js`

```
// requirements
var express = require('express'),
	app = express();
	
// a "GET" request to "/" will run the function below
app.get("/", function (req, res) {
	// send back the response: 'Hello World'
	res.send("Hello World");
});

// start the server
app.listen(3000, function () {
	console.log("Go to localhost:3000/");
});

```

Now you can start the server: 

```
node index.js
```


###Viewing Our Server 

Go to `localhost:3000`

* This sends a request to the server that looks like:
	
	```
	GET / HTTP/1.1
	Host: localhost:3000
	Connection: keep-alive
	Cache-Control: max-age=0
	Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
	User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36
	Accept-Encoding: gzip, deflate, sdch
	Accept-Language: en-US,en;q=0.8
	If-None-Match: W/"b-4a17b156"
	```

* The Server sends back something like the following:
	
	```
	HTTP/1.1 200 OK
	X-Powered-By: Express
	ETag: W/"b-4a17b156"
	Date: Mon, 11 May 2015 00:20:24 GMT
	Connection: keep-alive
	
	Hello World
	```
We can verify this with the [cURL](http://curl.haxx.se/) command: `curl -I localhost:3000`.

###A request/response cycle
![simple_server](simple_express.gif)


## Routing (15m)

Building an application will require us to have a firm grasp of something we call **routing**.  Each **route** is a combination of a **Request Type** and **Path**. 

| Request Type | Request Path | Response
| :--- | :--- | :--- |
| `GET` | `/` | `Hello World` |
| `GET` | `/burgers` | `Hamburger`, `Cheese Burger`, `Dble Cheese Burger` | 
| `GET` | `/tacos` | `Soft Taco`, `Crunchy Taco`, `Super Taco` |


Let's build these into our application:

`index.js`

```
var express = require('express'),
	app = express();
	
var burgers = [
				"Hamburger",
				"Cheese Burger",
				"Dble Cheese Burger"
			   ];
			   
var tacos = [
				"Soft Taco",
				"Crunchy Taco",
				"Super Taco"
			   ];
	
app.get("/", function (req, res) {
	res.send("Hello World");
});

app.get("/burgers", function (req, res) {
	//send all the burgers	   
	res.send(burgers.join(", "));
});

app.get("/tacos", function (req, res) {
	//send all the tacos		   
	res.send(tacos.join(", "));
});

app.listen(3000, function () {
	console.log("Go to localhost:3000/");
});

```

##BREAK! (10m)

## Url Parameters (10m)


What if we want to create an app that can dynamically say hello to anyone?

* Using **url parameters** add a dynamic route to the application, indicated by `:` and the variable name you want to use, we'll use `:name` for the example below.

```
app.get("/greet/:name", function (req, res) {
	res.send( "Hello, " + req.params.name );
});
```

Here we are seeing the first introduction to parameters that the application can identify. In the following route `:name` is consider a route parameter. We can access it using `req.params.name`.

| Request Type | Request Path | Response
| :--- | :--- | :--- |
| `GET` | `/greet/:name` | `Hello, :name` |


## Exercise: Indexing a collection (10m)

* Write a route with to allow you to access a `taco` by it's index in the array, such that one could go to the route: "/taco/2".
* Write a route with to allow you to access a `burger` by it's index in the array, similar to above.


## Query Params (10m)

Generally, you don't want to cram everything into a route. Just imagine when there are multiple parameters in route. Maybe we don't care about getting the order of the parameters correct. Luckily, there are **query parameters** you can include with each request.


Let's see query params in action. Go to [https://google.com/search?q=kittens&tbm=isch](https://google.com/search?q=kittens&tbm=isch)

* `?` denotes the beginning of the query parameters
* `=` indicates an assignment; anything to the left is the key, while the right represents the value
* `&` allows for the input of multiple parameters, separating each

Let's add our first route to practice query params.

```
app.get("/thank", function (req, res) {
	var name = req.query.name;
	res.send("Thank you, " + name);
});
```

Reset your server and go to [localhost:3000/thank?name=jane](localhost:3000/thank?name=jane). Note how we can now define parameters in the url after a `?`.

## Exercise: Calculator app (15M)

* Let's pair-up to build a simple calculator app!
* Integrate the `/multiply` route below into your app
* Build a `/add` route that uses query params `x` and `y` to add two numbers and send the result back.

For our a `/multiply` route that expects `x` & `y` in the query parameters, we can try something like the following:

```
app.get("/multiply", function (req, res) {
	var x = req.query.x;
	var y = req.query.y;
	var result = x * y;
	res.send(x + " plus " + y + " is " + result);
});
```


## Summary (5m)

We learned about 

* Routing to different resources, i.e. `/burgers` and `/tacos`
* Using dynamic parameters, i.e. `/burgers/:index` and `/tacos/:index` to request specific data
* Using query parameters for dynamic requests to serve up dynamic responses


This will be essential knowledge for building and interacting with applications that contain multiple resources, such as users, posts, comments, etc.

---

---


## Middleware, Static Files, and Assets

| Objectives |
| :---- |
| Review and discuss routing parameters |
| Explain and apply basic middleware for express |
| Apply static file serving for views and assets |



### Outline

* Review routing params
* Introduce views
	* Sendfile
* Using forms
* Handling form posts



### Setting Up

```
mkdir burger_app/
cd burger_app
touch index.js
npm init
npm install --save express 
```

### Routing Params


Let's build a `burgers` application. Let's start by creating a root route.



```
var express = require("express"),
	app = express();


// the root route
app.get("/", function (req, res) {
	var text = "View all burgers at " +
				"<a href='/burgers'>/burgers</a>";
	res.send(text);
});

app.listen(3000, function () {
	console.log("GO TO localhost:3000");
});

```


When you click the link after starting the server you should get an error. Now, let's add a route to view all burgers.


```
var express = require("express"),
	app = express();

var burgers = [
				"Hamburger",
				"Cheese Burger",
				"Dble Cheese Burger"
			   ];

// the root route
app.get("/", function (req, res) {
	var text = "View all burgers at " +
				"<a href='/burgers'>/burgers</a>";
	res.send(text);
});

app.get("/burgers", function (req, res) {
	var burgersText = burgers.join(", ");
	res.send(burgersText);
});

app.listen(3000, function () {
	console.log("GO TO localhost:3000");
});

```

It is terrible that we are not sending properly formatted HTML responses, and we should build those up, but let's ignore that for now. We don't want to clutter our application right now with string concatenations.

### Sending A File

Sometimes there is a pretty static HTML file you want to send as a response. There are ways to send files using Express -- `res.sendFile`.


Let's first create the file we want to send.

```
mkdir views
touch views/contact.html
```

Then let's put some contact info in our `contact.html`.

`views/contact.html`

```
<!DOCTYPE html>
<html>
	<head>
		<title>CONTACT</title>
	</head>
	<body>
	1234567
	</body>
</html>

```

In order to send this file we will need to use `res.sendFile`, which is a utility built into Express to help us send files. Next, we want to be able to specify, which file we want to send, `./views/contact.html`. In order to build up the `path` to this file we are going to use a built in Node utility called `path`.

> **path** is  just a utility built into node to help us **correctly** concat file paths
> 
> ```
> var path = require("path");
>
> path.join("Documents/", "/Homework");
> // => "Documents/Homework"
>
 ```



Let's add the following lines to our application somewhere near the top. Then let's make a `views` variable to hold a string that references the `./views` directory. *Note that the `./` means **current working directory***.
 
```
var path = require("path");
// define the ./views directory as a variable
var views = path.join(process.cwd(), "views");


```


Then let's add a route to handle grabbing the `contact.html` file from the `./views` directory.

```
...

app.get("/contact", function (req, res) {
	// helps go to ./views/contact.html
	var contactPath = path.join(views, "contact.html");
	res.sendFile(contactPath);
});
```


In total we should have the following:

```
var express = require("express"),
	app = express();

var path = require("path");
// define the ./views directory as a variable
var views = path.join(process.cwd(), "views");


var burgers = [
				"Hamburger",
				"Cheese Burger",
				"Dble Cheese Burger"
			   ];

// the root route
app.get("/", function (req, res) {
	var text = "View all burgers at " +
				"<a href='/burgers'>/burgers</a>";
	res.send(text);
});

app.get("/burgers", function (req, res) {
	var burgersText = burgers.join(", ");
	res.send(burgersText);
});

app.get("/contact", function (req, res) {
	// helps grab ./views/contact.html
	var contactPath = path.join(views, "contact.html");
	console.log(contactPath)
	res.sendFile(contactPath);
});

app.listen(3000, function () {
	console.log("GO TO localhost:3000");
});
```


### Exercise 

* Add a `home.html` file to your `views` folder and put some content inside it. Send it as a response when users go to [localhost:3000](localhost:3000/).

----

Let's make a `form` on our page to help us submit `burger` data to the server. Make a form that looks like the following on our `home.html`.

`/views/home.html`

```
<form action="/burgers" method="POST">
	<button>SEND REQUEST</button>
</form>

```

If we click this button we should get an error because we don't have a route to handle a `post` to `/burgers`.

```
app.post("/burgers", function (req, res) {
	res.send("BURGER POST RECEIVED!");
});
```

Now when we click our button we should see `"BURGER POST RECEIVED!"`. Now we aren't actually creating anything yet. To create something we'll need to actually add inputs fields into our `form`.

```
<form action="/burgers" method="POST">
	<input type="text" name="burger[name]" placeholder="what's your burger?">
	<button>SEND REQUEST</button>
</form>
```

When we submit this form we'll want to access the data being sent. There is only one problem... **data sent in the form is not a url or route param** so we can't access it using **req.query** or **req.params**. In fact, our app can't even process form data without a library to help us.


----

### Middleware


Let's install our first middleware. It's called `body-parser` and it will parse the body of a request being sent to us by the browser when a form is submitted.


```
npm install --save body-parser
```

Now we need to integrate it into the application. 

```
...
var bodyParser = require("body-parser");

app.use(bodyParser.urlencoded({extended: true}));

```

The `app.use` statement is telling our application to literally use the `body-parser` library before it moves onto route the request.

Now that we have the above setup we can update our `app.post("/burgers", ...)` route to use the `body` params submitted by the form.

```
app.post("/burgers", function (req, res) {
	var burger = req.body.burger;
	res.send("Nice " + burger.name);
});
```


All together we should have something like the following:


```
var express = require("express"),
	app = express();


var path = require("path");
// define the ./views directory as a variable
var views = path.join(process.cwd(), "views");

var bodyParser = require("body-parser");

app.use(bodyParser.urlencoded({extended: true}));

var burgers = [
				"Hamburger",
				"Cheese Burger",
				"Dble Cheese Burger"
			   ];

// the root route
app.get("/", function (req, res) {
	var text = "View all burgers at " +
				"<a href='/burgers'>/burgers</a>";
	res.send(text);
});

app.get("/burgers", function (req, res) {
	var burgersText = burgers.join(", ");
	res.send(burgersText);
});

app.get("/contact", function (req, res) {
	// helps grab ./views/contact.html
	var contactPath = path.join(views, "contact.html");
	console.log(contactPath)
	res.sendFile(contactPath);
});

app.get("/home", function (req, res) {
	var homePath = path.join(views, "home.html");
	res.sendFile(homePath);
});

app.post("/burgers", function (req, res) {
	var burger = req.body.burger;
	res.send("Nice " + burger.name);
});

app.listen(3000, function () {
	console.log("GO TO localhost:3000");
});
```

-----

### Adding Burgers

Instead of just responding with `Nice ...` let's actually add a burger to our list of burgers.

```
app.post("/burgers", function (req, res) {
	var burger = req.body.burger;
	burgers.push(burger.name);
	res.send("Nice " + burger.name);
});

``` 

That's pretty good! We can also send back a url where they can view their new burger.


```
app.post("/burgers", function (req, res) {
	var burger = req.body.burger;
	burgers.push(burger.name);
	res.send("See all burgers at localhost:3000/burgers");
});

```

Even better we could use something called a `redirect` to just send their browser there.

```
app.post("/burgers", function (req, res) {
	var burger = req.body.burger;
	burgers.push(burger.name);
	res.redirect("/burgers");
});
```

### Adding Assets

With our Express application we want to be able to serve assets **javascripts**, **stylesheets**, and **images**. By convention we generally put all these into a `public/` directory in our project.

```
app.use(express.static("public"))
```

Now we can make subfolders in our `public` folder for our assets.


```
mkdir public/javascripts
mkdir public/stylesheets
mkdir public/images

touch public/stylesheets/app.css
```


Inside of our `app.css` we can add some style for the body of our app.

```
body {
	background-color: red;
	color: white;
}
```


Then we just add a `link` tag in our `home.html` or other `view` files.


```
<!DOCTYPE html>
<html>
	<head>
		<title>HOME</title>
	</head>
	<body>
	<form action="/burgers" method="POST">
		<input type="text" name="burger[name]" placeholder="what's your burger?">
		<button>SEND REQUEST</button>
	</form>
	</body>
</html>

```

### Adding Bower

If you still want to use `bower_components` you'll need to tell express to send assets in the `bower_components` folder. Add the following line to your `index.js`.


```
app.use(express.static("bower_components"));

```

