#Week 1 Warmups

##Problem 1: Swapping varialbles
Write a program that will swap the values of two variables. That is, if we start with
```js
x == "a"; //=> true
y == "b"; //=> true
```
once the program has finished running we will have
```js
x == "b"; //=> true
y == "a"; //=> true
```
*Note:* Think about why we cant just do something like `x=y` followed by `y=x`. What goes wrong when we try to do this?

Solution

```
var x = "a";
var y = "b";

// hold onto the value of x;
var temp = x;
// set the value of x to be y
x = y;
// if we hadn't saved x's value
// we would have lost it
// but we can use temp to set y's 
// value to x's old value
y = temp;

```

##Problem 2: Reverse a String
Write a function `reverse` that takes in a string, and returns the reverse of the string. For example:
```js
reverse('Hello'); //=> returns "olleH"
```
*Note:* You cannot use any built-in array or string methods!

Solution

```javascript

var reverse = function (str) {
  var arr = str.split("");
  var len = arr.length;
  var mid = len/2;
  var holder;

  for (var i = 0; i < mid; i += 1) {
    holder = arr[i];
    arr[i] = arr[len - 1 - i];
    arr[len - 1 - i] = holder;
  }

  return arr.join("");
}



```

##Problem 3: Stacks and Queues

How would you store a List of people who were waiting in line?

> You should use a Queue, because a stack is a very first-in-last-out datastructure, which would mean the first person in line would get in last. A queue is a first-in-first-out structure, which means you get priority if you get there first.


##Problem 4: Number Property

Create a function which checks a number for three different properties.

is the number even?
is the number a multiple of 10?
is the number prime?

Each should return either true or false, which should be given as an array. 

*Examples*
```
numberProperty(7)  // ==> [true,  false, false] 
numberProperty(10) // ==> [false, true,  true]
```


```
var reverse = function(input) {
  var reversedString =  "";
  for (var i = 1; i < input.length + 1; i++) {
    reversedString += input[input.length - i];
  }
  return reversedString;
}
```
