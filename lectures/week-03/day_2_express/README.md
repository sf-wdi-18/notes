# Intro Express
## Dawn: Routes, Params, and Queries

| Objectives |
| :---- |
| Review and discuss the request and response cycle |
| Describe the parts of an HTTP request and url  |
| Apply basic routing knowledge to build a simple application |


## Outline

* Intro Express
	* A Simple App
* Routing
	* HTTP GET  
	* Request Params
* Query Params

### Getting Started

Before we get started let's setup a project directory.

```
mkdir express_examples
cd express_examples/
```

## Intro Express

**Background**

* What is Node.js?
	* A tool to run JavaScript outside the browser and directly on your OS.
* What is a *web application framework*?
	* A tool for handling middleware integration, routing, and other relevant concerns.
* What is Express?
	* A relatively small web application for building applications in Node.js.

### Setting Up	

Let's start up a simple **Express** application before we go forward:

* Make a directory and `index.js`  
	
	```
	mkdir quick_example
	cd quick_example/
	touch index.js
	```

* Then create a `package.json`, use the method below or substitute it with `npm init`.

	```
	echo {} > package.json
	npm install --save express
	subl .
	```
	
* ![folders](folders.png)


Now we need write some code for our simple application.


`index.js`

```
var express = require('express'),
	app = express();
	
app.get("/", function (req, res) {
	res.send("Hello World");
});

app.listen(3000, function () {
	console.log("Go to localhost:3000/");
});

```

Now you can start the web application: 

```
node index.js
```


### Viewing Our Server 

Go to `localhost:3000`

* This sends a request like the following to the server
	
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

![simple_server](simple_express.gif)


## Routing

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
				   
	res.send(burgers.join(", "));
});

app.get("/tacos", function (req, res) {
				   
	res.send(tacos.join(", "));
});

app.listen(3000, function () {
	console.log("Go to localhost:3000/");
});

```

### Route Params

Typically you will want to interact with a `resource` on a server, but in order to do that you'll have to have specify an `id` of some sort.


```
GET `/tacos` => `Soft Taco, Crunchy Taco, Super Taco`
```

But that route doesn't really respond to the input we've specified. Fortunately, there is a way to make a route more dynamic. Let's add the following route:

```
app.get("/greet/:name", function (req, res) {
	res.send( "Hello, " + req.params.name );
});
```

Here we are seeing the first introduction to parameters that the application can identify. In the following route `:name` is consider a route parameter. We can access it using `req.params.name`.

| Request Type | Request Path | Response
| :--- | :--- | :--- |
| `GET` | `/greet/:name` | `Hello, :name` |


### Exercise

* Write a route with to allow you to access a `taco` by it's index in the array.
* Write a route with to allow you to access a `burger` by it's index in the array.

------

The above routes require a little bit of engineering. We don't want to loose our nice route `/tacos` or `/burgers` that give us a list of burgers. However, we do need to indicate we want either a burger or taco.

```
app.get("/burgers/:index", function (req, res) {
	var index = req.params.index;
	var burger = burgers[index];
	res.send(burger)
});

```

Similarly, you do the same for a `taco`.

### Query Params

Generally, you don't want to cram everything into a route. Just imagine when there can be multiple parameters in route. Or, consider what kind of experience you'd be creating for people if the go the order of parameters wrong. Luckily, there are query parameters you can send with each request to a server that can be used to send back a response.


Let's see query params in action. Go to [https://google.com/search?q=kittens&tbm=isch](https://google.com/search?q=kittens&tbm=isch)


Let's add our first route to practice query params.

```
app.get("/thank", function (req, res) {
	var name = req.query.name;
	res.send("Thank you, " + name);
});
```

Go to [localhost:3000/thank?name=jane](localhost:3000/thank?name=jane). Note how we are now listing our parameters in the url after a `?`.

Let's continue our exploration of query parameters.

## Calculator Exercise

* Build a `/multiply` route that uses query params `x` and `y` to multiply numbers and send the result back.
* Build a `/add` route that uses query params `x` and `y` to add two numbers and send the result back.

----

### Discussion

For our `/multiply` route we can try something like the following:

```
app.get("/multiply", function (req, res) {
	var x = req.query.x;
	var y = req.query.y;
	var result = x * y;
	res.send(x + " plus " + y + " is " + result);
});
```

Hmm, that seems like it might work. Let's try that with our `/add` route.

```
app.get("/add", function (req, res) {
	var x = req.query.x;
	var y = req.query.y;
	var result = x + y;
	res.send(x + " plus " + y + " is " + result);
});
```

Hmm, why doesn't the above work? Well, all parameters are strings so when we add them we are treating them as strings. We want to turn them into numbers first. You should use `parseInt` to convert the numbers to integers.

```
app.get("/add", function (req, res) {
	var x = parseInt(req.query.x, 10);
	var y = parseInt(req.query.y, 10);
	var result = x + y;
	res.send(x + " plus " + y + " is " + result);
});
```

Note we said `parseInt` with `10` passed in as an argument because the we want integers in `base10`. You should refactor the `/multiply` route to also use `parseInt`.

## Summary

We learned about 

* Routing to different resources, i.e. `/burgers` and `/tacos`.
* Using information in our route, i.e. `/burgers/:index` and `/tacos/:index`.
* Using query paramters to form responses: `/thanks`, `/add`, and `/multiply`.

This will be critical for building applications with multiple resources and interacting with them: `/users`, `/articles`, `/comments`, et cetera.


## Dusk: Middleware, Static Files, and Assets

| Objectives |
| :---- |
| 