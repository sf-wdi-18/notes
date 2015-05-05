## Prototypes Revisited + Prototypal Inheritance

## Review

We mentioned in the last lesson that a prototype was the building block of an object and that when we create a new class, we can attach attributes and methods to the prototype (as a better alternative to adding them in the constructor function to save memory).


### Review of a Constructor and Prototype In JS

In javascript we don't have classes, so we use constructor functions and prototypes to create them.

```js
function Person(name){
    this.name = name
}

Person.prototype.greet = function(){
    return "Hello, my name is " + this.name;
};
```

## Inheritance

### Inheriting Via Prototypes

We have previously mentioned briefly, that objects can inherit properties and methods from other objects. In JavaScript we use prototypes to do this and this process is called inheritance. The formal term for this inheritance via prototypes is called prototypal inheritance.

#### Inheritance is done in two steps ####

1. Set the prototype of the subclass (the class that will get methods and properties from it's parent, which is also known as the superclass) to a new instance of the superclass (also known as parent class)

2. Set the constructor of the subclass equal to it's constructor function (which was overwritten when the prototype was set to the superclass)

Given the following example let's create a Student class that inherits from Person.

```js
function Person(name){
    this.name = name
}

Person.prototype.greet = function(){
    return "Hello, my name is " + this.name;
};

function Student(name, course){
    this.name = name;
    this.course = course;
};

Student.prototype = new Person
Student.prototype.constructor = Student;
```


Why do we reset the constructor? See [this](http://stackoverflow.com/questions/8453887/why-is-it-necessary-to-set-the-prototype-constructor) answer.

### Pitfalls/Side Effects - different properties for different classes

When we inherit in JS, we have to watch out for this in the wild:

    
```js
function Person(name){
    this.name = name;
    this.friends = [];
}

Person.prototype.addFriend = function(name){
    this.friends.push(new Person(name));
};

function Student(name){
    this.name = name;
};

Student.prototype = new Person()
Student.prototype.constructor = Student;
```

* Create a person and a student and add different friends to each. Can you see the persons' friends from the student object? What about the other way around?


One approach would be to make these changes:

```
function Person(name){
    this.name = name;
    //this.friends = [];
}

Person.prototype.addFriend = function(name){
    this.friends = this.friends || []; // make a new array if it doesn't exist
    this.friends.push(new Person(name));
};
```



### `call` and `apply`

Example 1:

```js
var getAge = function(friend) {
    return friend.age;
}

var john = { name: "john", age: 21 };
var tom = { name: "tom", age: 31 };
var bob = { name: "bob", age: 41 };
getAge(john)
getAge(tom)
getAge(bob)

```

rewritten using `this`

```js
var getAge = function() {
    return this.age;
}

var john = { name: "john", age: 21 };
var tom = { name: "tom", age: 31 };
var bob = { name: "bob", age: 41 };
getAge.call(tom)
getAge.call(john)
getAge.call(bob)

```

Example 2:

```js
var setAge = function(friend, newAge) {
    friend.age = newAge;
}

var john = { name: "john", age: 21 };
setAge(john, 12)

```

rewritten using `this`

```js
var setAge = function(newAge) {
    this.age = newAge;
}

var john = { name: "john", age: 21 };
setAge.call(john, 12)

```

Apply works just like call, but your second parameter is an array of objects instead of a comma separated list.
    
### Calling on a solution

Let's talk about using `call` or `apply` to set the `this` context for a function before it is run.

```js
function Person(name){
    this.name = name;
    this.friends = [];
}

Person.prototype.addFriend = function(name){
    this.friends.push(new Person(name));
};

function Student(name){
    // masks all the constructor properties including name (as the second parameter)
    Person.call(this, name);
};

Student.prototype = new Person()
Student.prototype.constructor = Student;
```

Unfortunately, this breaks the **Law of Demeter** (AKA **Priniciple of Least Knowledge**), which state that modular units should only have limited knowledge of the other units they are tied to.


### Useful methods when working with inheritance

### hasOwnProperty ### 

Object.hasOwnProperty('nameOfProperty') - always make sure the name of the property is in quotes. Classes that inherit from other classes will also return true if the property is checked.

Example 1 

```js
var taco = {
    food: "taco"
}

taco.hasOwnProperty(food) // returns an error
taco.hasOwnProperty("food") // returns true
```

Example 2 with inheritance

```js

function Person(name){
    this.name = name
}

Person.prototype.greet = function(){
    return "Hello, my name is " + this.name;
};

function Student(name, course){
    this.name = name;
    this.course = course;
};

Student.prototype = new Person
Student.prototype.constructor = Student;

p = new Person("bob")
s = new Student("tom")

p.hasOwnProperty("name") //returns true
s.hasOwnProperty("course") //returns true
s.hasOwnProperty("name") //returns true
    
```

### instanceOf

This method is a bit more common  and the syntax looks like this:

`object instanceOf Class`

Example 1:

```js
var color = "green";
color1 instanceof String; // returns true

```

Example 2 with inheritance

```js

function Person(name){
    this.name = name
}

Person.prototype.greet = function(){
    return "Hello, my name is " + this.name;
};

function Student(name, course){
    this.name = name;
    this.course = course;
};

Student.prototype = new Person
Student.prototype.constructor = Student;

p = new Person("bob")
s = new Student("tom")

s instanceof Person //returns true
p instanceof Student //returns false
Person instanceof Object //returns true
String instanceof Object //returns true
Object isntanceof Boolean //returns false
    
```

#### Quirk with instanceOf

Like we mentioned in the previous lecture, adding the word `new` when creating an object is essential. Let's look at these two examples

```js
var color1 = new String("green");
color1 instanceof String; // returns true

var color2 = String("green");
color2 instanceof String; // returns false
```

Let's examine these two using console.dir, what do you see?


### isPrototypeOf

```js
Object.prototype.isPrototypeOf(Function) // returns true
Boolean.prototype.isPrototypeOf(Number) // returns false
```


You can read more about the difference between isPrototypeOf and isInstanceOf [here](http://stackoverflow.com/questions/2464426/whats-the-difference-between-isprototypeof-and-instanceof-in-javascript)


#### Some good additional reading

[http://geekabyte.blogspot.com/2013/03/difference-between-protoype-and-proto.html](http://geekabyte.blogspot.com/2013/03/difference-between-protoype-and-proto.html)

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Introduction_to_Object-Oriented_JavaScript#Inheritance](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Introduction_to_Object-Oriented_JavaScript#Inheritance)