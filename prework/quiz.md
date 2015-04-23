 Prework Quiz

**1) In terminal, a `$` indicates that:**

	A) The computer is unresponsive
	B) The user is ready to go to lunch
	C) It's the equivalent of the Spinning Beach Ball of Death
	D) The computer is awaiting user input

*(D)*

**2) What command would one use to rename 'untitled_essay.doc' to 'draft1.doc'?**

	A) cp draft1.doc untitled_essay.doc
	B) mv draft1.doc untitled_essay.doc
	C) cp untitled_essay.doc draft1.doc
	D) mv untitled_essay.doc draft1.doc

*(D)*

**3) What is Git?**

	A) A scripting language.
	B) A distributed version control system.
	C) A database management system.
	D) A program called Generated Internet Transmissions.

*(B)*

**4) What command would you use to move all your changes since your last commit to the staging area?**

	A) git commit -m "removed a GIF"
	B) git push .
	C) git mv .
	D) git add .

*(D)*

**5) How do you update your remote repository with changes to your local repository?**

	A) git pull
	B) git commit -m "update to remote repository"
	C) git push
	D) git update

*(C)*

**6) You are browsing through Github and you see this incredible project. You think, "I want a remote copy of ga-students' repo to add my updates to." What should you first do?**

	A) Send the author a message
	B) Submit a pull request
	C) Locally clone the HTTPS URL
	D) Fork the repo

*(D)*

**7) Evaluate the statement: `(true || false) && (true && false)`**

	A) false
	B) true
	C) 0
	D) true && false

*(A)*


```
x = 0;
x = x + 2;
x = x + 7;
```


**8) What is the final value of `x`?**

Answer: 9

```
var x;
x === x;
y === y;
```

**9) In the above statement, what is the value of `x === x`?**

	A) true
	B) false
	C) null
	D) undefined

 *(A)*

 **10) Again, evaluate the above statement. What is the value of `y === y`?**

	A) true
	B) false
	C) null
	D) error, "y is not defined"

 *(D)*

 ```
var age = 32;
if (age < 21) {
  console.log('Come back when you are older!');
} else if (age < 50) {
  console.log('Thank you. Come on in.')
} else {
  console.log('No need to card you, right this way!');
}
```
**11) What will `console.log` print out if age is 32?**

	A) Come back when you are older!
	B) Thank you. Come on in.
	C) No need to card you, right this way!
	D) Undefined

 *(B)*

**12) What statement can you use to completely exit a loop and continue on through your code?**

	A) continue
	B) exit
	C) break
	D) end

 *(C)*

 **13) A `for` loop contains three parts which are seperated by `;`. What does the second part of a `for` loop do?**

	A) sets the final expression
	B) initializes a counter
	C) is a condition that determines whether whether to execute the code block
	D) none of the above

 *(C)*

```
function myFunction(x) {
  if (x > 30) {
    return x - 30;
  } else if (x < 10) {
    return x;
  } else {
    return x - 1;
  }
}
```

**14) What value will be returned from the function above when x is equal to 25?**

	A) 25
	B) 24
	C) 9
	D) 10

  *(B)*

 **15) What value will be returned from the function above when x is equal to 10?**

	A) 25
	B) 24
	C) 9
	D) 10

 *(C)*

```
function anotherFunction(x, y) {
  return (x < y ) ? x : y;
}
```
**16) How would we call the above function to compare 10 and 20?**

	A) anotherFunction(x, y)
	B) anotherFunction(10, 20)
	C) anotherFunction[10, 20]
	D) anotherFunction[x, y]

 (B)

**17) What would we expect to get back if, from the last question, we compared 10 and 20?**

	A) true
	B) false
	C) 10
	D) 20

*(C)*

```
function square(x) { return (x * x ) }
function cube(x) {
 	return (x * square(x));
}
console.log(cube(2));
```

**18) What does the above code print to the console?**

	A) 2
	B) 6
	C) 8
	D) 16

 *(C)*

 
 ```
 function totalUp(a, b, c) {
  var tot = a + b + c;
  if (tot > 0 ) {
    return tot;
  }
 }
 totalUp(2, 4, 6, 8);
 ```

**19) What would the above code evaluate to?**

	A) 12
	B) 20
	C) 10
	D) 18

 *(A)*

**20) How might you write a function called `maxNumber` that gives us the biggest value from a set of four numbers?**

Answer:
```
function maxNumber(a, b, c, d) {
  array = [a, b, c, d];
  array.sort(function(a, b){
    return a - b;
  })
  return array[array.length-1];
}
```
or
```
function maxNumber(a, b, c, d) {
  if (a > b && a > c && a > d) {
    return a;
  } else if (b > a && b > c && b > d) {
    return b;
  } else if (c > a && c > b && c > d) {
    return c;
  } else {
    return d;
  }
}
```

**21) In JavaScript, how would we access the second element in an array called `myArray`?**

	A) myArray[2]
	B) myArray(2)
	C) myArray[1]
	D) myArray(1)

 *(C)*

```
var fruits = ['apple', 'orange', 'banana'];
fruits.pop();
fruits.push('grape');
fruits.push('banana');
```

**22) After the above code has executed, what does the fruits array contain?**

	A) ['apple', 'orange', 'banana']
	B) ['orange', 'banana', 'grape', 'banana']
	C) ['apple', 'orange', 'grape', 'banana']
	D) ['banana', 'grape', 'apple', 'orange']
 
 *(C)*


```
	var ages = [26, 28, 30, 28, 17];
```

**23) What would `ages[2];` evaluate to?**

	A) 26
	B) 28
	C) 30
	D) 17

 *(C)*

 **24) What would `ages.indexOf(28);` evaluate to?**

	A) 0
	B) 1
	C) 2
	D) 3

 *(B)*

 ```
var monkees = [ 'Peter Tork', 'Micky Dolenz', 'Davy Jones', 'Michael Nesmith'];
 ```

 **25) What would `monkees.length` evaluate to?**

	A) 4
	B) 48
	C) 1
	D) 3

 *(A)*

```
var rainbowColors = ['red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'violet'];
for (var i = 0; i < rainbowColors.length; i++) {
  console.log(rainbowColors[i]);
}
```

**26) What does the above for loop do when executed?**

	A) It prints each item in the array "rainbowColors" to the console
	B) It reverses the order of the elements in the array "rainbowColors"
	C) It prints the index value of each element in the array "rainbowColors"
	D) It returns a new array filled with the same elements from the "rainbowColors" array

 *(A)*

```
var loginInfo = {"username": "johnny23", "password": "hunter2"};
```

**27) Given the above code, how would you access 'hunter2'?**

	A) loginInfo["hunter2"]
	B) loginInfo("hunter2")
	C) loginInfo["password"]
	D) loginInfo("password")

 *(C)*

**28) Given the above code, how would you change the username to "billy96?"**

	A) login_info("username") = "billy96"
	B) login_info["username"] = "billy96"
	C) login_info["username", "billy96"]
	D) login_info("username", "billy96")

 *(B)*

```
var twitterAccount = {
  userName: 'wilw',
  followers: [
    'gates_mcfadden',
    'jonathanfrakes',
    'SirPatSew',
    'akaworf'
  ],
  following: [
    'wesleytips',
    'RikerGoogling'
  ],
  tweets: [
    {
      body: 'The Vampire who liked having a cold because he was really into his coffin',
      retweets: 207,
      favorites: 528
    },
    {
      body: 'I am mixing #RadioFreeBurrito episode 40',
      retweets: 12,
      favorites: 92
    },
    {
      body: 'Based on my very small sample size in this Starbucks, mom jeans are making a comback with twenty-somethings',
      retweets: 102,
      favorites: 480
    }
  ],
}
```

**29) How would you access or drill down inside a large data structure? Declare a variable `followers` and assign it to the array of the accounts that follow wilw.**

Answer:

```
var followers = twitterAccount.followers;
```

or

```
var followers = twitterAccount["followers"];
```

**30) Declare a variable `totalTweets` and assign it to the total number of tweets that have been made by `wilw` so far?**

Answer:

```
var totalTweets = twitterAccount.tweets.length;
```


