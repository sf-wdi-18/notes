#Intro to JavaScript Functions

##Learning Objectives

* Articulate the importance of functions in a computer language
* Contrast an algorithm with a function
* Create Javascript functions with parameters
* Distinguish between returning and printing a value
* Deferential global vs local scopes

---

##What are functions?

Computer science can essentially be divided into two core elements: **data structures** & **algorithms**.

A **data structure** organizes information.

An **algorithm** *abstractly* describes how to manipulate data to solve a problem.

A [**function**](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions) is a concrete implementation of an algorithm in a computer language. *It is a "subprogram" that encapsulates a specific behavior.*

---

##Why do we care?

"Functions are the *bread and butter* of JavaScript programming.

The concept of wrapping a *piece of program* in a value has many uses.

It is a *tool to structure* larger programs, to *reduce repetition*, to *associate names with subprograms*, and to isolate these subprograms from each other."

-Marjin Haverbeke, *Eloquent Javascript*.

Question: Why are functions important?

---

##Algorithms vs functions

How could we describe the function `square` in an algorithm vs in a function?

**Algorithm —**
*abstract*

```
Take a number, multiply it by itself, and return the product.
```

**Function —**
*concrete*

```
var square = function(num) {
	return num * num;
}
```
Question: What are the fundamental differences between an algorithm and a function?

---

##Components of a function

The **parameters** also known as *arguments* are what is passed into the function; there can be multiple.

```
var iHaveParameters = function(firstParam, secondParam, heyImTheThirdParam) {
  //do something with the parameters
}
```

The **return statement** is what the function outputs; there can be only one.

```
var functionThatReturns = function() {
  return true;  //simply returns true
}
```

The **function body** is everything inside the actual function.

```
var rockingBod = function() {
  //this is the body of the function
}
```

---

##Declaring a function

Either:

```
var sweetFunk = function() {
	//sweetness
} 
```

or:

```
function sweetFunk() {
	//sweetness
}
```
is acceptable for declaring a function; just stick to one convention.

Note, a function can also be a key to an object; as a result it can more specifically be referred to as a method.

```
duck = {
  cheer: function() {
    console.log("quack! quack! quack!");
  }
}

duck.cheer()    // => "quack! quack! quack!"
```

---

##Break Time

###15 minutes

<img src="http://i.giphy.com/wsEX8uMrTRDoI.gif" style="width: 250px;">

---

##Challenge: Variable output

In the next **10m**:

1) Define a function `maxOrMin` that takes three parameters: two numbers and a boolean.

2) Have it return the larger of the two numbers if the boolean is true, otherwise have it return the lesser of the numbers.

---

##Example solution

```
function maxOrMin(num1, num2, max) {
    //sort the numbers
    var sorted = [num1, num2].sort(function(a, b){
      return a - b;
    });
    if(max) {
    	//if max is true return the greater number
        return sorted[1];
    } else {
    	//otherwise return the lesser number
        return sorted[0];
    }
}
```

---

##Scope

Understanding this concept is essential to a proper foundation of JavaScript. Scoping rules vary from language to language. JavaScript has two scopes: *global* & *local* scope.


Quite simply, a **scope** represents the area of your program where variable is defined. You can think of scope 

As a rule: **A new function introduces a new scope**

---

##Scope Example

```
var cityBoy = "I'm global";
 
function smallTown() {
  var cityBoy = "I'm local";
 
  console.log ("local:", cityBoy);     
}
 
smallTown();          
 
console.log("global:", cityBoy);     
```

Question: What happens if you forget to a variable's scope if you forget to declare it using the keyword `var`?

---

##Callbacks

A **callback** is a function that is passed into another function. A function that can take a callback is known as a **first-class function**.

```
var consoleMe = function(message) {
  console.log("I'm the callback, now displaying message...");
  console.log(message);
}
var firstClassFunction = function(message, callback) {
  console.log("I'm the first class function, now calling the callback...");
  callback(message);
}
firstClassFunction("AYO!", consoleMe);
```

Question: Consider the JS function `sort`, is it a firstclass function?

---

##Challenge: Callbacks

Create a function called `sweetNothings` that takes a name as a parameter and outputs a love poem to that person.

Create another funtion called `swoon` that also takes in a name and a callback as parameters and in the body of the function calls the callback with the name passed in.

Finally try calling `swoon("Delmer", sweetNothings);` so that a love poem is written to Del.

---
<img src="http://i.giphy.com/dsKnRuALlWsZG.gif" style="width:350px">

---

##Further Discussion Topics

We discuss these concepts at a later date. They are related, but more advanced. So have a solid understanding of these topics before you move on.

* [Variable Hoisting](http://www.sitepoint.com/demystifying-javascript-variable-scope-hoisting/#hoisting) – Sitepoint article
* [Closures](http://stackoverflow.com/questions/111102/how-do-javascript-closures-work#answer-111200) – Stack Overflow post
* [Recursion](http://www.codecademy.com/courses/javascript-lesson-205/0/1) — Code Academy lesson

---

