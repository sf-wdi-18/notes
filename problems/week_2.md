#Week 2 Warmups

##Problem 1: Factorial using recursion
Write a function `factorial` that takes a single parameter `n`, and computes the [factorial](http://en.wikipedia.org/wiki/Factorial) of `n`. For example

```
factorial(5) => 5 * 4 * 3 * 2 * 1
factorial(4) => 4 * 3 * 2 * 1
factorial(3) => 3 * 2 * 1
factorial(2) => 2 * 1
factorial(1) => 1
factorial(0) => 1
```

Here is some starter code:

```js
var factorial = function(n) {

};
```

##Problem 2: Determine whether a given string is a [palindrome](http://en.wikipedia.org/wiki/Palindrome)
Write a function `isPalindrome` that takes in a single parameter `str`, a string, and returns `true` if the string is a palindrome, and false otherwise. For example

```
isPalindrome('hello') => false
isPalindrome('hannah') => true
```

Here is some starter code:

```js
var isPalindrome = function(str) {

};
```


##Problem 3: [Magic Square](http://en.wikipedia.org/wiki/Magic_square)
Write a function `isMagic` that takes in a matrix, represented as an array of arrays of length N and returns true if the matrix is a magic square and false otherwise. For Example:

```
isMagic[[1,2,3], => false
        [4,5,6],
        [7,8,9]]
        
isMagic[[2,7,6], => true
        [9,5,1],
        [4,3,8]]
```

Here is some starter code:

```js
var isMagic = function(mat) {
  // code goes here
};
```

##Problem 4: Determine if an array has any duplicates
Write a function `hasDupes` that takes in an array of primitive data-types and returns true, if there are duplicates and false otherwise. For example

```
hasDupes([1,2,3,4]) => false
hasDupes([12,2,1,3,4,5,5]) => true
```

Here is some starter code:

```js
var hasDupes = function(arr) {
  // Code goes here
};
```

##Problem 5: Choose-2
Write a function `chooseTwo` that takes in an array and returns an array of all of the possible pairs of elements in the array. For example

```
chooseTwo([1,2,3]) => [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]]
chooseTwo(['a','b','c','d']) => [['a','b'],['a','c'],['a','d'],['b','a'],['b','c'],['b','d'],['c','a'],['c','b'],['c','d'],['d','a'],['d','b'],['d','c']]
```

Here is some starter code:

```js
var chooseTwo = function(arr) {

};
```
