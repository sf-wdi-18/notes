# Implimenting Iterators
Build your own.

| Objectives |
| :--- |
| Identify iterators, and how and when to use them |
| Differentiate `forEach`, `map`, and `reduce` |
| Construct iterator functions and test them together |

## Iterators

### `forEach`
In a `for` loop we often refer to the `i` part as "iteration count". When we say `i++` we are "incrementing" by 1. We often use this same variable to "index into" arrays, allowing us to loop over their values. Iterator / incrementor / index. It's *purely by convention* that we use the letter "i", we could just as well use 'j' or 'aardvark'.

```
for(var i=0; i<3; i++) {
    console.log(i)
}

// 0
// 1
// 2
```

But `for` loops are a pain when we simply want to "iterate" over the contents of an array. I don't care how many things are in it, I just need to do the same thing for all the items!

Make this work:

```
var customers = ["Joe", "Jeff", "Giles"]
for(var j=0; ...; ...){
    //...
}

// 1 Joe
// 2 Jeff
// 3 Giles
```

But hang on a second, we're doing a lot of hard work building our `for` loop. Surely laziness is a virtue. Doesn't Array have some built in methods that do this kind of thing for us? [MDN Array Reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)

```
var customers = ["Joe", "Jeff", "Giles"]
customers.SOMEMETHOD(callbackfn)

// 1 Joe
// 2 Jeff
// 3 Giles
```


**Challenge:**

* Jumbalaya Shack has a line out the door. I takes about two minutes per order. Output the customer's name + their expected wait time.

### `map`
Often we want to do more than just perform an action, like `console.log()`, on every loop. When we actually want to modify/manipulate our array, `map` is our best friend!


Juniper thinks her prices are scaring off customers. Subtracting one penny might help:
```
var prices = [3.00,4.00,10.00,2.25,3.01];
prices.SOMEMETHOD(callbackfn);
//[2.99, 3.99, 9.99]
```


**Challenge:**

* On second thought, Juniper only wants to subtract a penny if it changes the dollars place, e.g.: 10.00 --> 9.99
* Prices are going up! Juniper needs to raise her prices by 5%.

### `reduce`
Goyle has a lucrative dog walking business. He's made mucho mulha this summer. How much did he make?

```
var earnings = [20, 25, 60, 20, 85, 20];
earnings.SOMEMETHOD(callbackfn);
// 210
```

**Challenge:**

* Goyle already has $500 in the bank. How would you incorporate this into your method call? (YOU ARE NOT ALLOWED TO USE `output + 500`)
* BONUS: Goyle's curious how many times he earned $20 this summer. (HINT: there's a method for this!)

### Working with Reference Types

Sometimes we actually want to change the underlying data:

```
var startData = ["a","b","c"];
var endData = startData.map(function(v,i){
    return i + v + "!";
})

startData; // ["a","b","c"]
endData; // ["0a!","1b!","2c!"]
```

How could we insure that we change the *original* object?

### Using named functions as callbacks

So far we've been using anonymous functions for our callbacks. We can also use named functions, like so:

```
earnings.filter(function(a){
    return a === 20;
});

// same as

function checkForTwenty(value){
    return value === 20;
}

earnings.filter(checkForTwenty);
```

* Why don't I call `checkForTwenty` using "()"?
* What is `value`? Where is it coming from?

## Build Your Own

Let's think about `forEach`. What's happening internally?
* What are our inputs?
* What is our output?
* What happens on each loop?
* What does the callback function do?
* What gets passed into our callback function? i.e. what arguments?
    * Where does it come from?
    * How do we know what to name it?

###Exercises:

Work together in groups of 3 to solve the following:

DO NOT USE ANY BUILT IN ITERATOR METHODS: `forEach`, `map`, `reduce`, etc.

**Warm Up Challenges:**

* Create a function `hereYaGo`.
    *  Input: an array.
    *  Output: the same array.
    ```
        someArray === hereYaGo(someArray);
    ```
* Create a function `first`.
    * Input: an array.
    * Output: the first item in that array.
    ```
        first(["apple", "toast", "cheese"]);
        // "apple"
    ```
* Create a function `last`.
    * Input: an array.
    * Output: the last item in that array.
    ```
        last(["apple", "toast", "cheese"]);
        // "cheese"
    ```
* Create a function `printEach`:
    * Input: an array.
        * On each iteration, print the item to the console.
    * Output: undefined;
* Modify the above to become `printEachPlus`:
    * Input: an array and `function(){return "!"}`
        * On each iteration, print the item to the console PLUS the output of the callback function.
    * Output: undefined;
    ```
        printEachPlus(["apple", "toast", "cheese"], function(){
            return "!"
        });
        // "apple!"
        // "toast!"
        // "cheese!"
    ```
* Modify the above to become `printEachSuperPlus`:
    * Input: an array and `function(v){return v + "!"}`
        * On each iteration, print the output of calling the callback function with the current item as an argument.
    * Output: undefined;
    ```
        printEachPlus(["apple", "toast", "cheese"], function(item){
            return item + "!"
        });
        // "apple!"
        // "toast!"
        // "cheese!"
    ```

**The Challenge**

We are going to impliment our own iterators, from scratch.

For the following challenges it is essential that you understand the requirements to fully impliment the built-in array method. See [MDN Array Reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)

Remember to start small and add features later. It's easier to build incrementally than to try to do everything all at once.

* Create a function `myEach` which impliments `Array.prototype.each`
* Create a function `myMap` which impliments `Array.prototype.map`
* Create a function `myReduce` which impliments `Array.prototype.reduce`

BONUS:

* Create a function `myFilter` which impliments `Array.prototype.filter`
* Create a function `mySome` which impliments `Array.prototype.some`
* Create a function `myEvery` which impliments `Array.prototype.every`


**Wrap it Up**

We've built some handy utility functions for ourselves! Let's wrap them up in our very own library so we can include it in our projects, and share it with other developers:

```
myUtils = {}
myUtils.myEach = myEach;

// now we can use our utility function!
myUtils.myEach(["a","b","c"], function(letter, index){
    console.log(index, letter, "Yay!")
})
```

#### Solutions
```
customers.forEach(function(v,i){
    console.log( (i+1) + " " + v );
});

customers.forEach(function(v,i){
    console.log( v + ", " + i*2 + " minutes");
});

prices.map(function(p){
    return p - .01;
});

prices.map(function(v){
    return (v%1 === 0) ? (v - .01) : v;
});

prices.map(function(v){
    return parseFloat((v + v*.05).toFixed(2));
});

earnings.reduce(function(a,b){
    return a + b;
});

earnings.reduce(function(a,b){
    return a + b;
}, 500);

earnings.filter(function(n){
    return n === 20;
});

var startData = ["a","b","c"];
startData.forEach(function(v,i){
    startData[i] = i + v + "!";
})
startData; // ["0a!","1b!","2c!"]
```