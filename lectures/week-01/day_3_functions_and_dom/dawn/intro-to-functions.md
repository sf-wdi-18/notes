#Intro to Functions

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

A [**function**](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions) is a concrete implementation of an algorithm in a computer language. *It encapsulates modular behavior.*

---

##Why do we care?

"Functions are the *bread and butter* of JavaScript programming.

The concept of wrapping a *piece of program* in a value has many uses.

It is a *tool to structure* larger programs, to *reduce repetition*, to *associate names with subprograms*, and to isolate these subprograms from each other."

-Marjin Haverbeke, *Eloquent Javascript*.

Question: Why are functions important?

---

##Algorithms vs functions

How could we describe the function `square` in an algorithm and in a function?

Assume have a number, represented by the variable `num`.

**Algorithm —**
*abstract*

```
Take the number, multiply it by itself, and output the product.
```

**Function —**
*concrete*

```
var square = function(num) {
	return num * num;
}
```
Question: What is the fundamental difference between an algorithm and a function?

---

##Challenge: Define a function

Define a function, named `computerNoises`, that prints `beep beep boop bap!` to the console. Then call your newly created function and test if it works!

---

##All together now!

```
var computerNoises = function() {
	console.log("beep beep boop bap!");
}

computerNoises();
```

---

##I/O

Although not necessary, functions typically have **inputs** & **outputs**. Let's explore each different combination:

######No Input or Output

```
var noIO = function() {
     console.log("This function has no parameters & does not return anything");
}
```
######Just an Input

```
var justI = function(number) {
      console.log(number);
};
```
######Just an Output

```
var justO = function() {
      return "I am the output, also known as the return statement";  
}
```
######Both an Input & and Output

```
var fullIO = function(number) {
       return number + 1;
}
```

Can you identify what feature endows a function with an input? How about an output?

Can you distinguish between between a function that `console.log`'s a variable vs one that `return`s it? 

---

##Components of a function

The **parameters** are what is passed into the function, aka the *input*. There can be multiple parameters.

```
var iHaveParameters = function(firstParam, secondParam, heyImTheThirdParam) {
  //do something with the parameters
}
```

The **return statement** is what the function returns, aka the *output* of a function. There can be only one return statement.

```
var functionThatReturns = function() {
  return true;  //simply returns true
}
```

The **function body** is everything inside the actual function. I.e.:

```
var rockingBod = function() {
  //this is the body of the function
}
```

---

##Break Time

###15 minutes

<img src="http://i.giphy.com/wsEX8uMrTRDoI.gif" style="width: 250px;">

---

##Challenge: Variable output

In the next **10m**:

1) Define a function `sorting` that takes two numbers and a boolean.

2) If the boolean is true have it return the larger number and if false have it return the lesser number. 

Advice:

* Break down the problem into descrete pieces and build the pieces separately before synthesizing them.

* Write in sublime and paste you code into Chrome's developer tools to make sure it does what you expect.

---

##Example solution

```
function sorting(num1, num2, max) {
    //sort the numbers
    var sorted = [num1, num2].sort();
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
var test = "I'm global";
 
function testScope() {
  var test = "I'm local";
 
  console.log (test);     
}
 
testScope();          
 
console.log(test);     
```



---

##Discussion Questions

What are the values of having local scopes?

What happens if you forget to a variable's scope if you forget to declare it using the keyword `var`?

What does *polluting the global namespace* refer to?

---
<img src="http://i.giphy.com/dsKnRuALlWsZG.gif" style="width:350px">

---

##Further Discussion Topics

We discuss these concepts at a later date. They are related, but more advanced. So have a solid understanding of these topics before you move on.

* [Variable Hoisting](http://www.sitepoint.com/demystifying-javascript-variable-scope-hoisting/#hoisting) – Sitepoint article
* [Closures](http://stackoverflow.com/questions/111102/how-do-javascript-closures-work#answer-111200) – Stack Overflow post
* [Recursion](http://www.codecademy.com/courses/javascript-lesson-205/0/1) — Code Academy lesson

---

