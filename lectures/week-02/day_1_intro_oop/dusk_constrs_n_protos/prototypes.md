# Constructors Cont.
## A Prototype In JS


## Review and Motivation 

In javascript we previosly learned about the constructor pattern, which allowed us to do the following:

```
  function Person(first, last){
    this.firstName = first;
    this.lastName = last;
    this.greet = function () {
      return "Hello, my name is " + this.firstName;
    };
  }
  
  var tSwift = new Person("Taylor", "Swift");
  tSwift.greet();
  // => Hello, my name is Taylor
  // OMG!!!
```

We can also make another person.

```
 var lana = new Person("Lana", "Del Rey");
 lana.greet();
```

We see that both `lana` and `tSwift` have the same `greet` functionality, but if we compare their `greet` methods we get a surprise.

```
lana.greet == tSwift.greet
// => false
```
This is because each time we run the `new Person(...)` command we create a new object using the `first` and `last` name passed in, and we then set `greet` to a newly created function.
Basically, **we create a new greet function every time we create a new Person**. That can't be good.


## Prototype

Luckily we have an efficient way of creating methods that doesn't require us to waste memory re-creating functions for every new object.

**WE MUST USE THE PROTOTYPE!**

![Yoda](http://stream1.gifsoup.com/view3/1377657/yoda-saber-skills-o.gif)


Now we refactor our Person to use a Prototype and we will explain more about it in a moment.

```
  function Person(first, last){
    this.firstName = first;
    this.lastName = last;
    this.greet = function () {
      return "Hello, my name is " + this.firstName;
    };
  }
```
becomes

```
  function Person(first, last){
    this.firstName = first;
    this.lastName = last;
  }

  Person.prototype.greet = function () {
    return "Hello, my name is " + this.firstName;
  };
```

This changes nothing about how we create a person. The following works as expected.

```
var tSwift = new Person("Taylor", "Swift");
tSwift.greet()
```

Behind the scenes javascript has moved the `greet` method onto a shared property called the `prototype`. Now the `greet` function isn't created with every new person.

```
lana = new Person("Lana", "Del Rey");
lana.greet == tSwift.greet
// returns true
```
We can check if a method or property belongs to an object or on a prototype by using `hasOwnProperty`

```
tSwift.hasOwnProperty("lastName");
// returns true
tSwift.hasOwnProperty("greet");
// returns false
```
### Review:

* Why do we use the prototype?
  * It is an efficient way of creating methods on an object.
* What is a `hasOwnProperty`?
  * It is property that belongs directly on object not in it's prototype.
* What is a prototype property/method?
  * Any property that is in the object, but not a hasOwnProperty.
* How do we create a new `Person`?
  * the same way we create a person using just constructors from earlier.


### Exercises Using Prototype

Please use the prototype for creating methods.

* Create a constructor for a `superHero` that takes a `firstName` and `lastName`. Give each superHero a `superPunch` method that returns `"WHAM!"`.
* Create a constructor for a `robot` that takes `name` and `purpose`. Give each robot a `greet` method that returns `"beep boop"`

## Object Oriented Programming 

We haven't really created very advanced methods to interact with our objects. Our methods mostly return strings. In reality there are two main types of methods on an object.

### Getters

A *getter* method returns some information about associated with our object

```
  function Person (first, last) {
    this.firstName = first;
    this.lastName = last;
  }

  // A Getter for the firstName
  Person.prototype.getFirstName = function () {
    return this.firstName;
  };

  // A Getter for the lastName
  Person.prototype.getLastName = function () {
    return this.lastName;
  };

  // A Getter for the fullName
  Person.prototype.fullName = function () {
    return this.lastName + ", " + this.firstName;
  };

```


### Setters

A setter method changes one or more properties associated with an object.


```
  function Person (first, last) {
    this.firstName = first;
    this.lastName = last;
  }


  // A setter for the firstName
  Person.prototype.setFirstName = function (newFirst) {
    this.firstName = newFirst;
  };

  // A setter for the lastName
  Person.prototype.changeLastName = function (newLast) {
    this.lastName = newLast;
  };

  // A setter for the fullName
  Person.prototype.changeFullName = function (newFirst, newLast) {
    this.firstName = newFirst;
    this.lastName = newLast;
  };
```

Properties associated with any object have getter and setters built-in to the same key.

```
var friend = {name: "joe"};

// we can get name using
friend.name
// so friend.name is also a getter

// we also set name using
friend.name = "josh";
// so friend.name is also a setter
```

That's kinda cool, so we won't typically have to worry too much about getters and setters.

## Exercises/More Homework

* Make a `Starship` constructor that takes a `model` and `ownerName`. 
  * Give your `StarShip` a `setTopSpeed` method and a `getTopSpeedMethod` that let you change and read the `topSpeed`. *Assume `topSpeed` is just a number.*
  * Give your `Starship` an `accelerateTo` method that sets `currentSpeed` to some number, unless that number is greater than its `topSpeed`.
* Make a `Dice` constructor that takes a `numberOfSides`. Add a method called `getSide` or `roll` that randomly returns a number from `1` up to the `numberOfSides`.
  * Modify your `getSide` method to record the returned side in a `lastRoll` property.
* Make a `Radio` constructor that takes in an `ownerName` and a `signalType` ("AM" or "FM"). 
  * Add a `setStation` method to your radio that allows the following ranges:
    * `535` to `1705` for "AM".
    * `88` to `108` for "FM".
  * Add a `listen` method that returns the following:
    * `"distorted music"` for "AM".
    * `"clear music"` for "FM".
* Make a `Mailer` constructor that takes a `from` email address, and has `currentMessage` set to an empty object, as well as a `sentMessages` array.
  * Add a `setSendTo` method that sets `currentMessage.sendTo` to be a specified email.
  * Add a `setSubject` method that sets `currentMessage.subject` to be a specified subject.
  * Add a `send` method that sets `currentMessage.from` to be `this.from`, pushes `currentMessage` into `sentMessages`, and sets `currentMessage` to be a new object.
    * Modify `send` so that it checks if `currentMessage` has both a `sendTo` and `subject` before pushing to `sentMessages`.
