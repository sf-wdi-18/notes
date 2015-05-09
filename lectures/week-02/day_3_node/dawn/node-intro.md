# Intro to Node 

##Learning Objectives

By the end of this session, students should be able to...

* Articulate the history of Node
* Explore the Node REPL & global objects
* Run a JS file from Node
* Use the Node debugger
* ~~ Break ~~
* Spin up a simple node server & use the event loop
* Require custom modules
* Install and require an npm
* Begin using Underscore

---

##Terminology

* Ryan Dahl
* V8
* Event loop
* Node.js
* npm
* Isomorphic JavaScript


##What is Node?

Node is a platform for building **fast, scalable network applications**. Its advantages over other server side languages is that it uses **event-driven, non-blocking I/O model** that makes it light-weight and efficient. It is **built on top of Google's [V8 Javascript engine](http://en.wikipedia.org/wiki/V8_%28JavaScript_engine%29)**, the same engine powering the Chrome browser.

##Installation

Head to [node's homepage](https://nodejs.org/) & click install. Make sure to reference the [Node docs](https://nodejs.org/api) in the future.

##Serverside JS

In 2008 Google **released the [V8 Engine](http://en.wikipedia.org/wiki/V8_%28JavaScript_engine%29) in the Chrome Browser** which transformed JavaScript into something fast. Rather than interpreting the language on the fly, it began **compiling Javascript to native machine code** before executing it. [Ryan Dhal](), the creator of Node, then took the V8 Engine and ported it to it's own runtime platform called 'Node.js'.

This allowed developers to use JavaScript outside of the browser and for the first time developers were using **a single programming language for both client and server**!

Running the *same code* on the client & server is known as **isomorphic JavaScript**


##Entering the REPL
Let's get started by opening up a node REPL. We can do this by running the `node` command in our terminal. 

```
$ node
>
```
*Try writing some JS!*

**Note:** to exit type `Control-c` twice.

## [Global Objects](https://nodejs.org/api/globals.html#globals_global_objects)



* global: This is the global scope, the highest namespace
* process: Is an instance of the EventEmitter class, representing the current node session
* Buffer: Raw data is stored in instances of the Buffer class
* console: Used to print stdout and stderr (standard output & standard errors).
* require
* module
* exports: An alias for (module.exports)
* _: An alias for the previous return statement

Full list [here](https://nodejs.org/api/globals.html#globals_global_objects)

## Running a JS File

In addition to giving us a javascript REPL, we can use the node command to run a javascript file. To see this in action, first create a file and open it in sublime by typing the following commands into your terminal:

```
$ touch myApp.js
$ subl myApp.js
```
Then in sublime add the following content:

```
var hello = function() {
  return "Hello, World";
};

console.log(hello());
```
Now if we go back to our terminal and run

```
$ node myApp.js
```
	
## [Debugging](https://nodejs.org/api/debugger.html)

* Place the `debugger` keyword where you want to insert a line break
* Then run: `node debug myApp.js`

When paused in the debugger type...

* `c` or `continue` to move to next breakpoint
* `n` or `next` to step to next line
* `repl` allows you to start typing JS and checking variable definitions (easy to forget!)

Full debugger commands [here](https://nodejs.org/api/debugger.html#debugger_commands_reference)

---
10m break

---

##A Simple Webserver

```
http.createServer(function (req, res) {
  res.end('Hello world!');
}).listen(8000);
```

#####Sexy!

![dancing bots](http://i.giphy.com/Lj4W2cgweVUkM.gif)

##Node Event Loop
![Node event loop](http://i.stack.imgur.com/YCTgK.png)

Simple example of non-blocking I/O

```
function sayHi() { console.log('Hi there') }
setTimeout(sayHi, 5000);
console.log('Oh hey')
```

##Creating your own module

* Touch a file in the same directory named `greetings.js`
* Inside `greetings.js` type:


```
//function definition
var myPersonalGreeting = function() {
  return "Hey buddyguy!";
}

//module export
exports.greeting = myPersonalGreeting;
```

Adding our function to the exports object allows it to be exported!

* Inside `myApp.js` we can now require our new module by giving specifying the path:

```
var greet = require('./greetings');
```

* And then call it with `greet.greeting();`
* // => "Hey buddyguy!"

##Installing packages using NPM

NPM is the [Node Package Manager](https://www.npmjs.com/) which helps us **manage 3rd party, opensource modules**, similar to the one we just created.

Much of node's most powerful capabilities are unlocked when leveraging the power of the packages it has available to it. Let's take a second to explore! 

## NPM Version Managing

Using a package manager helps manage dependencies. This allows developers to share code and ensure that and requirements/dependencies to other libraries are versioned correctly. The `package.json` file contains the information of the project and, even more importantly, all it's dependencies!

####To add a dependency to your project

```
npm init									//Creates a package.json file.
npm install underscore chalk bower --save	//When installing, adding '--save'
											//adds dependencies to the 
											//package.json (you can chain
											//packages together).
```

It is bad practice to commit your `node_modules` directory to github (it's unnecessary remote storage); instead, you `package.json` contains all the information anyone contributing to the project will need. 

####To bring dependencies into you project

The command: `npm install` will look for a `package.json` file and install all of the dependencies into your project. Sweet!

##Playing w/ Chalk

In sublime add the following content to the `play.js` file

`npm install chalk`

`var chalk = require('chalk');`


`console.log(chalk.red('Hello World'));`
To run the file type node play.js in your terminal.

We can add more things like the following

`var chalk = require('chalk');`

```
console.log(chalk.red('Hello World'));
console.log(chalk.bold.blue('glad you made it :)'));

var rainbow = chalk.red('r') + chalk.yellow('a') + chalk.green('i')
                + chalk.cyan('n') + chalk.blue('b') + chalk.magenta('o')
                + chalk.white('w');
console.log(rainbow);
```

See the [docs](https://www.npmjs.com/package/chalk) for chalk to see what else you can do.

##Require Underscore

Now let's add underscore to our project:

* `npm install underscore`
* `ls` to see what changes were made to your directory
* Require underscore with `var _ = require('underscore');

##On Your Own


Explore the underscore docs [here](http://underscorejs.org/). Some great methods include:

**Collections**

* `.each`
* `.map`
* `.filter`
* `.reduce`
* `.pluck`
* `.shuffle`
* `.sample`

**Arrays**

* `.compact`
* `.flatten`
* `.without`
* `.uniq`
* `.object`
* `.range`

**Functions**

* `.memoize`
* `.throttle`
* `.once`
* `.after`

**Object**

* `.invert`
* `.functions`
* `.extend`
* `.pick`
* `.isEqual`

**Utility**

* `.times`
* `.random`
* `.mixin`

##Further Learning

* [Introduction to Node.js](https://www.youtube.com/watch?v=jo_B4LTHi3I)
* [History of Node.js](https://www.youtube.com/watch?v=SAc0vQCC6UQ)
* [Ryan Dahl's AMA](http://www.reddit.com/r/node/comments/h1m2o/i_am_ryan_dahl_creator_of_nodejs_ama)



<!--Syntax highlighting-->
<script src="http://yandex.st/highlightjs/7.3/highlight.min.js"></script>
<link rel="stylesheet" href="http://yandex.st/highlightjs/7.3/styles/github.min.css">
<script>
  hljs.initHighlightingOnLoad();
</script>



