# Object Orientation
Lesson on object oriented programming (OOP).

| Objectives |
| :--- |
| Understand the core principles of OOP |
| Create custom objects and constructors |

## Objects Review

```
var dictionary = {
	computer: "A person who makes calculations",
	hypertext: "text which is not constrained to be linear"
}
```

* A object is a unordered collection of key-value pairs.
* Keys are strings.
* Keys are unique.

**Get/Set**

We differentiate between "getting" (or "reading") a value, and "setting" (or "writing"/"overwriting" a value).


**Dot Notation vs. Bracket Notation**

These work:

* `el['innerText']`
* `"hello"["length"]`
* `10["toString"]()`
* `someList['pop']()`
* `$(".balloon")["addClass"]("exploded")`

But...

* `el.style.padding-right` (bad)
	* `el["style"]["padding-right"]` (good)
	* `el.style.paddingRight` (good)
* `["big", "medium", "small"].0` (bad)
	* `["big", "medium", "small"][0]` (good)

Can you describe what breaks?

## Introduction to OOP
What is OOP? Let's ask Steve Jobs...

    Steve Jobs: Objects are like people. They’re living, breathing things that have knowledge inside them about how to do things and have memory inside them so they can remember things. And rather than interacting with them at a very low level, you interact with them at a very high level of abstraction, like we’re doing right here.
    Here’s an example: If I’m your laundry object, you can give me your dirty clothes and send me a message that says, “Can you get my clothes laundered, please.” I happen to know where the best laundry place in San Francisco is. And I speak English, and I have dollars in my pockets. So I go out and hail a taxicab and tell the driver to take me to this place in San Francisco. I go get your clothes laundered, I jump back in the cab, I get back here. I give you your clean clothes and say, “Here are your clean clothes.”
    You have no idea how I did that. You have no knowledge of the laundry place. Maybe you speak French, and you can’t even hail a taxi. You can’t pay for one, you don’t have dollars in your pocket. Yet I knew how to do all of that. And you didn’t have to know any of it. All that complexity was hidden inside of me, and we were able to interact at a very high level of abstraction. That’s what objects are. They encapsulate complexity, and the interfaces to that complexity are high level.

[source](http://www.edibleapple.com/2011/10/29/steve-jobs-explains-object-oriented-programming/)

In summary:

* Objects encapsulate data and behavior
* Objects communicate by passing "messages" back and forth.
* Objects know as litle about each other and their environment as possible.

Finaly, in Javascript it turns out that...
**EVERYTHING IS AN OBJECT**

## Plain Objects
A plain object in JavaScript can be created like this:

```javascript
var object = {}; // literal syntax

// or

var object = new Object(); // constructor syntax
```

We'll get to what the `new` keyword does in a moment. The literal syntax is preferred.

We could then assign properties and methods to the object. For example, think of a car:

```javascript
var car = {};

// Assign some properties
car.speed = 0;
car.color = 'red';
car.make = 'BMW 7 series';

// Assign some methods
car.accelerate = function(gain) {
    car.speed += gain;
    return car.speed;
}

car.decelerate = function(loss) {
    car.speed -= loss;
    return car.speed;
}
```

We could also apply the properties and methods all at once using the hash syntax:

```javascript
var car = {
    speed: 0,
    color: 'red',
    make: 'BMW 7 Series',
    accelerate: function(gain) { ... },
    decelerate: function(loss) { ... }
};
```

And now we could play around with these properties and methods:

```javascript
car
// => { speed: 0,
//  color: 'red',
//  make: 'BMW 7 series',
//  accelerate: [Function],
//  decelerate: [Function] }

car.speed
// => 0

car.color
// => 'red'

car.accelerate(20);
// => 20

car.speed
// => 20
```

Is this already OOP? Sort of. It's just not reusable. So long as we only need one car, this is fine, but once we want to reuse this logic with multiple cars (for example, to build a car race), we have to rewrite the above logic every time. That means for each car, we need to assign the properties `speed`, `color`, and `make`, and the methods `accelerate()` and `decelerate()`.

## The Power of Constructors
Constructors allow us to abstract out logic that all objects of a certain kind should share. Rather than describing a specific car, for example, we can describe the idea of a car. To do that, we need to ask ourselves two key questions:

- What does the car know?
- What can the car do?

The first question is about the values it can store/remember, the second is about a car's abilities. Again, we want to define these two things at the high level of the idea of a car, so that we can then instantiate that idea into an actual car. The instantiation could then happen multiple times, leaving us with many different cars that share the same abstract characteristics, but can all have different values for each.

### Writing a Constructor
"Contructor" is really just a fancy term for a function that stars with a capital letter. We're really just declaring a function.

For constructors, function declarations are preferred over function expressions:

```javascript
function Car() {
    // logic here
}
```

Inside the `Car` constructor, we can then define properties and methods on a variable and return that variable:

```javascript
function Car() {
    var car = {};
    car.color = 'red';
    return car;
}
```

This can even be shortened by using a special keyword: `this`. If used inside the constructor, `this` simply refers to the constructed instance itself. It is always simply available and is returned by default, allowing us to achieve the same functionality by simply writing:

```javascript
function Car() {
    this.color = 'red';
}
```

Much cleaner!

So far so good. But what if we want cars to have different colors? How can we achieve that functionality? It's very simple, since constructors are just functions, and we can pass parameters to functions:

```javascript
function Car(color, make) {
    this.color = color;
    this.make = make;
}
```

Let's also extend the functionality so that a car can accelerate and decelerate:

```javascript
function Car(color, make) {
    // From parameters
    this.color = color;
    this.make = make;

    // Set speed to 0 since that's what a car starts out with
    this.speed = 0;

    // Assign methods
    this.accelerate = function(gain) {
        this.speed += gain;
        return this.speed;
    }

    this.decelerate = function(loss) {
        this.speed -+ loss;
        return this.speed;
    }
}
```

Excellent! Now we can instantiate a car using the `new` keyword:

```javascript
var car = new Car('red', 'BMW');

car
// => { color: 'red',
//  make: 'BMW',
//  speed: 0,
//  accelerate: [Function],
//  decelerate: [Function] }
```

Looks the same as at the very beginning of the lesson, you might say. That's true, except that now we can reuse the Car constructor to instantiate several cars without having to write any code twice.

```javascript
var car1 = new Car('red', 'BMW');
var car2 = new Car('black', 'Porsche');
```

## Active Learning
Partner up with your buddy!

Create a genie constructor. Each genie should have the following:

* name
* color
* wishes
* a grantWish() method

Create a "wish" object. It should (eventually) have the following properties:

* The wish
* Whether the wish was granted
* Optional: When the wish was made
* Optional: Who granted the wish
* Optional: Who made the wish

How would you use your new wish object in conjunction with a genie? How would you pass it in? What would you have to modify in your existing genie-code?

Finally, create a "person" object. They should have the following properties:

* name
* a makeWish method
* a list of past wishes

How does your person and the genie communicate? How do you make a wish? How would you get that wish granted?


## Reflect
Reiterate over core OOP concepts with your buddy. Test each other! Help each other out with any questions you might have.

## Closing Words
The goal of OOP is really to bring programming closer to the real world and to make components more reusable. The real world doesn't consist of some functions in a vacuum; it consists of real objects that can store/know/remember things, and that can do things. For example, a person knows his/her name and can breathe; a panther is black and can hunt; a tree is green and can do photosynthesis.

Again, to better resemble the real world in programming and to make our components reusable, we use OOP. It will accompany us throughout the rest of the course, and many other programming languages, such as Ruby, are purely object oriented. Understanding OOP in turn means understanding the core concepts of many programming languages.