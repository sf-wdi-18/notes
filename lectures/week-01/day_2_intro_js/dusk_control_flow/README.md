#Intro Control Flow

| Objectives |
| :---- |
|   Identify and discuss boolean operators and truthyness |
|   Apply logical operators and comparators to structure control flow |
|   Discuss and apply iterating and looping patterns |

`true` and `false` are important keywords in both Ruby and Javascript.

##Boolean Logic

In boolean logic, everything is either `true` or `false`.

```
typeof(true); // "boolean"
typeof(false); // "boolean"
```

Here are some related ideas: 

| true | false |
| ------------- |:-------------|
| on | off |
| 1 | 0 |

We can combine true and false statements to make larger assertions.

To do so, we need to use some "logical operators":

| English | "and" | "or" | "not" |
| ------------- |:-------------|:-------------|:-------------|
| Javascript | `&&` | &#124;&#124; | `!` |
| e.g. | `a && b` | a  &#124;&#124; b | `!b` |

Each example above will evaluate to either `true` or `false`.

**Truth Tables**

It turns out that AND (`&&`) and OR (`||`) have some interesting properties. To illustrate this let's consider the following truth tables:

AND is only `true` if *both* statements are true:

```
hasName && hasQuest; // true or false
```

| AND `&&` | **true** | **false** |
| ------------- |:-------------|:-------------|
| **true** | `true` | `false` |
| **false** | `false` | `false` |


OR is only `false` if *both* statements are false:


```
hasCoconuts || hasQuest; // true or false
```

| OR &#124;&#124; | **true** | **false** |
| ------------- |:-------------|:-------------|
| **true** | `true` | `true` |
| **false** | `true` | `false` |

The last example is really interesting because it has the following effect: given a proposition like `hasCoconuts || hasQuest`, if `hasCoconuts` evaluates to true, we're done! We can "short circuit" the rest of the statement!

In other words --> we have the basis for **control flow**.

The last example tends to be the hardest to comprehend, and the most useful to learn!


**Negation**

When we introduce the concept of negation into the mix, we can make some cool proofs. For instance, De Morgan's Law coverts between AND and OR statements:

```
!(a && b) === !a || !b // these are the same!

!(a || b) === !a && !b // these are too!
```

Exercise: No shirt, no shoes, no business! Using logical operators, create a statement which evaluates to `true` if I'm allowed in the business, and `false` if I'm not.

**Comparisons**

To make assertions we commonly use a logical "comparator":

| strict equality | loose equality | not equal | greater than | less than | greater than or equal to | less than or equal to |
| ------------- |:-------------|:-------------|:-------------|:-------------|:-------------|
| `===` | `==` | `!==` | `>` | `<` | `>=` | `<=` |

These can be combined to make longer assertions that evaluate to either `true` or `false`.

```
    a > 10 && a !== 11;
```

Beware loose equality!

* Strict equality (`===`) is the best practice!
* Here's why: [Javascript Equality Table](https://dorey.github.io/JavaScript-Equality-Table/)


## Conditionals
With a basic understanding of boolean logic and mathematical comparators we can introduce the idea of control flow or "branching" logic.

![](http://cdn.thebolditalic.com/paperclip/html_images/35108/images/original/will-you-be-late_final.png) [source](http://www.thebolditalic.com/articles/5398-your-sf-transportation-problems-in-one-flowchart)

####If Statements
Conditionals are a way of essentially skipping over a block of code if it does not pass boolean expression.


```
var num = 22;

if (num % 2  === 0) {
  console.log("is even");
}

```

Here's another example:

```
if ( badWeather ) {
	// take the bus
}
```

We can tack on an "else" at the end of any if-statement. You can think of this as the "default" behavior. If the first condition isn't met, we automatically do the "else":

```
if ( badWeather ) {
	// take the bus
} else {
	// walk!
}
```

In practice, `else` isn't super helpful. But `else if` can be very useful if we need to chain together multiple, mutually exclusive statements. Only one of these conditions will be met!

```
if ( hasCar ) {
	// drive it!
} else if ( hasBike ) {
	// ride it!
} else if ( hasTransitPass ) {
	// take the bus!
} else {
	// better start walking!
}
```

You can also nest if statements (but the best practice is to keep things as "flat" as possible).

**Best Practices:**

* Indentation: Every time you open a curly brace, start a new line, and tab in one level of indentation.
* Nesting: Keep it flat! Avoid deeply nested conditionals.

###Conditionals Exercise: Can I ride?

Jimmy loves roller coasters, but there are a bunch of rules (ugh!) for riding:

For starters, it costs 5 tokens. Here's how we might code that:

```
var tokens = 3; // Jimmy's tokens

// Can he ride?
if ( tokens >= 5 ) {
	console.log("Step right up!");
} else {
	console.log("Sorry, you can't ride")
}
```

Additional Requirements:

  - Must have 5 tokens
  - Must be at least 4ft tall
  - Must be at least 12 years old
  - Riders under 12 must be accompanied by an adult
  - (If the boss isn't looking, you can sneak in!)
  - Riders with a reservation get in free.


## Iterating

It is a way of incrementally repeating a task. Iterating is a way of describing procedures like:

* print "hello world" 50 times
* print each item in a shopping list

Typically iteration has three or four main parts 

* an initial state
* a condition for repeating
* process to be run for each repetition 
* a state change for proceeding to the next step

It isn't surprising that the primary means of iterating in most languages is called a `for` loop, which has the following structure:

```

for ( intial state; check condition; change state) {
  run this code for before changing state
}

```

Or a  more concrete example:


```

var friends = ["larry", "moe", "curly"];

for (var index = 0; index < friends.length; index = index + 1) {
  console.log(friends[index]))
}

```

In teenage English, *"so start at zero and like add one every loop until you hit 3"*.


### For-Loop Exercises

* Create a loop which prints out:

	```
	0
	1
	2
	3
	4
	5
	```
* Create a loop which prints out:

	```
	5
	4
	3
	2
	1
	0
	```	


* Create the "Bottles of beer on the wall" song:

		5 bottles of beer on the wall,
		5 bottles of beer!
		Take one down and pass it around,
		4 bottles of beer on the wall
	* How would you fix "1 bottles of beer"?
	* How would you change "0" to "No more"?
	* Use a prompt to ask the user how many verses they want to hear

* Given `var shopping = ["bread", "oranges", "milk", "eggs"]` print out:

	```
	"bread"
	"oranges"
	"milk"
	"eggs"
	``` 
	
	* Then try to print:
	
		```
		"1 Bread"
		"2 Oranges"
		"3 Milk"
		"4 Eggs"
		``` 

##Truthiness and Bool*ish* Values

So far we've seen that we can use the primitives `true` and `false` directly in our code to influence control flow.

We've also seen that we can make statements and assertions that evaluate to either `true` or `false`:

* `hasQuest;`
* `weatherToday === "rainy";`
* `age >= 21 || hasImpressiveMoustache;`

In every case we get back a boolean: `true` or `false`;

The truth value of `true` is `true`.

The truth value of `false` is `false`.

But, what is the truth value of:

	* "abc";
	* "";
	* -1;
	* 0;
	* 3.14159;

Do these things even *have* a truth value?

It turns out they do!

**Truthy / Falsy**

We can informally describe data as being "truthy" or "falsy".

```
var test_case = "abc"; // test 'em all!
if ( test_case ) {
	console.log(test_case + " is truthy!")
} else {
	console.log(test_case + " is falsy!")
}

```

Wowa! What's going on here?

Our condition succeeds or fails if it considers the test input to be `true` or `false`. But how is `"abc"` possibly `true`? Is this a bug?

What happens if we equivalate... I mean equate them:

```
"abc" === true; // ?
```

Suppose we *negate* our value (with a "bang", `!`):

```
!"abc"; // ?
```

Suppose we *double* negate it:


```
!!"abc"; // ?
```

What data type did we start with? What did we end with?

HINT: use `typeof(startValue)` and then `typeof(endValue)`

In your own words, describe what's going on here:

* What effect does the bang have? And the double bang?
* What is type coercion? What does it mean to "coerce" a data type?
* Which values are "truthy"? Can you find more examples?
* Which values are "falsy"? Can you list them all?
* Is there any kind of logic to it?

More info on truthy / falsy / equality: [Javascript Equality Table](https://dorey.github.io/)


## While Loop Exercises

Here's an example of a `while` loop:

```
var chars = "A";
while( chars !== "Aaaaa" ){
	chars += "a"
}
```

* Create a prompt loop using a `while` that asks "What is your Quest?" until the user supplies an input.
	* What if I hit "cancel"?
	* What if I don't type anything in?
* Create a `while` loop that asks "How old are you?" until the user supplies a valid numeric input.
* Let's play the Number Guessing Game using a while loop / prompt.
	* The computer picks the number (let's start with `3`)
	* Ask the user for their guess: "What's your guess?"
		* If they guess too high, tell me "too high"
		* If they guess too low, tell me "too low"
		* If they guess the number, the game is done!
	* Bonus: Keep track of how many guesses it takes! "Attempt #2: What's your guess?"


##Control Flow Tricks

**Loose Control Flow** (watch out for edge cases!)

```
if ( username ) {
	// submit signup form
}

// same as

if ( username.length > 0) {
	// submit signup form
}
```

**Ternary operator**

```
var username = last_name ? first_name + last_name : first_name;

// same as

var username = first_name;
if ( last_name ) {
	username = first_name + last_name;
}
```

**Conditional assignment: `||` as Default Operator**

```
var bestCity = yourCity || "San Francisco";

// same as

var bestCity = "San Francisco";
if ( yourCity ) {
	bestCity = yourCity;
}

```

**Conditional Execution: `&&` as Guard Operator**

```
badThing && alert("Uh oh!")

// same as

if ( badThing ) {
	alert("Stop that")
}

```

## What's Falsy? -- Answers

* `false`
* `undefined`
* `null`
* `0`
* `NaN` ("Not a Number")
* `""` (empty string)