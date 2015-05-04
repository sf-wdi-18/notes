# Javascript Constructors

> By the end of this lecture, students will understand constructors in a javascript. A way of create objects that share the same methods and attributes

## Constructors

There is a lot of different ways to create objects. 

**Object Literal Notation**

```
var person = {};
```

**Constructor Notation**

```
var person = new Object();
```

We can actually use constructors for creating `Array`'s also

```
// Array is the constructor
var myArr = new Array();

// The above is equivalent 
//  to using an array literal
var myArr = [];
```

### Creating Custom Objects

In trying to model the world around us it becomes useful to create functions that generate objects for us quickly. In general a **constructor creates new objects using some given properties.**

```
function Person (first, last) {
  // create new object
  var newPerson = {};

  // set firstName and lastName
  newPerson.firstName = first;
  newPerson.lastName = last;

  // return newPerson
  return newPerson;
}
```

Note: A constructor has a few key differences.

* It uses **function declaration**
* It uses **captialized CamelCase**.

  ```
  function SomeConstructor () {}
  ```

We can use our constructor to quickly create new people.

```
var jane = Person("Taylor", "Swift");
var john = Person("John", "Doe");
```



### Exercise

1.) Let's create a constructor for a `Pet` that has both a `name` and `age`.


The above kind of constructor should seem repetitive. This is because we have to always write something like the following:

```
function Person (first, last) {
  // create new object
  var newPerson = {};

  // some code

  // return newPerson
  return newPerson;
}
```

Luckily, there is a nice keyword called `new` that will both create a new object and makes it accessible as `this`. Thus 

```
function Person (first, last) {
  // create new object
  var newPerson = {};

  // set firstName and lastName
  newPerson.firstName = first;
  newPerson.lastName = last;

  // return newPerson
  return newPerson;
}
```

becomes just

```
function Person (first, last) {

  // set firstName and lastName
  this.firstName = first;
  this.lastName = last;

  return this;
}
```

and we can create a new `Person` by saying the following:

```
var jane = new Person("Taylor", "Swift");
var john = new Person("John", "Doe");
```

Actually, the `new` keyword does one more cool thing. It returns `this` implicitly, so we don't have to say return. Now we can just write


```
function Person (first, last) {
  // set firstName and lastName
  this.firstName = first;
  this.lastName = last;
}
```

**That's clean code!**


### Exercise 

* Rewrite our `Pet` example assuming the `new` keyword will be used with our constructor.
* Write a constructor for a `SuperHero` that takes a `name` and an `alterEgo`.



### Adding Methods

If we use the constructor pattern we can add methods to our newly created object and not just properties. 

```
function Person (first, last) {
  this.firstName = first;
  this.lastName = last;
  this.fullName = function () {
    return this.lastName + ", " this.firstName;
  };
}

var tSwift = new Person("Taylor", "Swift");

console.log(tSwift.firstName);
console.log(tSwift.fullName());
```

### Need To Know Trivia

The `new` keyword does the following

  * Creates a `new` object
  * Implicitly returns the the `new` object
  * Sets the `constructor` property to the object Person


##Pitfalls

When using the constructor

Don't try to call a constructor without the `new` keyword.

```
Bad --> Person("Taylor", "Swift");
Good --> new Person("Taylor", "Swift");
```

### Static Methods and Properties

It turns out that functions are just objects as well. **Everything in Javascript is an OBJECT!!! MADNESS**

![unlearning](http://www.quickmeme.com/img/07/0744051b8a554e4e3a5b2fe34857e62ee879e7143632b33b80a4cb2e1e128cac.jpg)

```
function Person (first, last) {
  this.firstName = first;
  this.lastName = last;
  this.fullName = function () {
    return this.lastName + ", " this.firstName;
  };
}

Person.inspiringMessage = "Use the force!!";
console.log(Perosn.inspiringMessage);
// logs "Use the force!!"
```

When we set properties or methods on a constructor they are called **Static Properties** or **Static Methods**. Let's see a static property that keeps track of people being created.


```
function Person (first, last) {
  this.firstName = first;
  this.lastName = last;
  this.fullName = function () {
    return this.lastName + ", " this.firstName;
  };

  Person.all.push(this);
}

Person.all = [];

var tSwift = new Person("Taylor", "Swift");
console.log(Person.all);
// logs an array with tSwift inside.
```