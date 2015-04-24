#Intro to Functions

##Learning Objectives

* Create Javascript functions with parameters
* Distinguish between returning and printing a value
* Deferential global vs local scopes

---

##What is a function?

Computer science can essentially be divided into two elements: **data structures** & **algorithms**.

An **algorithm** is an abstract concept, describing how to manipulate data to solve a problem.

A **function** is a concrete implementation of an algorithm in a computer language. A function encapsulates any *modular behavior* you've defined.

---

##Example

What if we wanted to describe `adding` two numbers in an algorithm and in a function?

**Algorithm —**
*abstract*

```
Start counting from num1, count upwards as many units as the num2 represents.
```

**Function —**
*concrete*

```
var addTwoNumbers = function(num1, num2) {
	return num1 + num2;
}
```
---

##Challenge: Defining a function

Define a function, named `schoolHouseRock`, that prints `Conjunction Junction, what's your function?` to the console. Then call your newly created function and test if it works!

---

##All together now!

```
var schoolHouseRock = function() {
	console.log("Conjunction Junction, what's your function?");
}

schoolHouseRock();
```

---

##I/O

While common, not every function has an **input** or an **output**.

```
noIO = function() {
     console.log("This function has no parameters & does not return anything");
}
```

```
justI = function(number) {
      console.log(number);
};
```

```
justO = function() {
      return "I am the output, also known as the return statement";  
}
```

```
fullIO = function(number) {
       return number + 1;
}
```

What endows a function with an input? What endows a function with an output? Discuss amongst yourselves.

---

**Blah**

##Return Statements

**Blah**

##Scoping

**A new function means a new scope**



###Sources

* [Cho](https://github.com/sf-wdi-14/notes/blob/master/lectures/week-1/_3_wednesday/dawn/introduction-to-functions.md)
* [Tim](https://github.com/wdi-sf-fall/notes/blob/master/week_01_fundamentals/day_3_intro_to_javascript/dusk_control_flow_and_functions/functions.md)
* [Brett](https://github.com/sf-wdi-17/notes/blob/master/lectures/week-01/_3_wednesday/dusk/javascript_functions.md)

