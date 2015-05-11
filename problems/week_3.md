#Week 3 Warmups

##Problem 1: Simple Search
Write a function `simpleSearch` that takes a two parameters: `val` and `arr`, where arr = some array to search, and val = the value to search for. If the value is found in the array, your function should return the index of that value. If the value is not found, your function should return -1.

```js
var arr = [1, 5, 19, 8, 41];
simpleSearch(arr, 5) => 1
simpleSearch(arr, 8) => 3
simpleSearch(arr, 102) => -1
```

Here is some starter code:

```js
var simpleSearch = function(arr, val) {

};
```

##Problem 2: Implement a [Binary Search](http://en.wikipedia.org/wiki/Binary_search_algorithm) Function
Write a function `binarySearch` that takes in two parameters:
  1. arr (the array to search)
  2. val (the value to search for)

If the value is found in the array, the function returns true. Otherwise it returns false.

There are a few key requirements for binary searching. But in essence, a binary search takes advantage of the fact that a sorted set of data can be subdivided into smaller problems over and over again. Because of this, a binary search can be extremely fast, but it also requires that a set of data be sorted before the search begins.

Also, you'll probably want to implement your `binarySearch` function so that it uses recursion (you can do it without recursion, but it will be **much** more difficult.) 

As a reminder, a recursive algorithm calls itself to complete its task.

Recursive algorithms always have:
  1. A recursion condition
  2. A terminal condition (that is, a condition upon which recursion should end)

For example, to calculate a `factorial` we can use recursion:
```js
var factorial = function(n) {
    if (n > 0) {
        return n * factorial(n-1);
    } else {
        return 1;
    }
}
```

In the `factorial` function, the recursion condition states that as long as n is greater than 0, we continue to recurse and we reduce the value of n by 1 with each iteration. Once n == 0, we stop and return 1.

We can also illustrate recursion with the simple idea of spiraling down, and then back up again. We'll explain further.

Anyway, here's some starter code for your new `binarySearch` function

```js
var binarySearch = function(arr, val) {
    
}
```


##Problem 3: Merge two sorted arrays
Write a function `merge` that takes in two sorted arrays and merges them together such that the resulting array remains sorted.

Some starter code for ya:

```
var merge = function(arr, arr2) {
    
    return <something> // This should return a new sorted array that represents the union of both arr, and arr2
}
```

##Problem 4: TicTacToe Refactoring, OOP and TDD (What did Mike do?) -- BONUS!!

Mike has implemented an elegant and complex solution to TicTacToe this weekend. Take a look at it, and try to explain it to the rest of the class.
