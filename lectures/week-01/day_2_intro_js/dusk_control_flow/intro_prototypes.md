Objects as key-value pair containers.
Holding Lunches.

Objects



```
var genie = {
    name: 'Genie',
    color: blue,
    wishes: 3
}

genie.grantWish = function(wish){
    // subtract one wish
    return "Your wish is granted"
}
```

* How would you subtract a wish from within the grantWish method?

This works great! But what happens if I say:

```
genie.wishes = 100;
```

How could I prevent this from happening?

To explore this idea, let's introduce a new syntax for making genies:

```
function Genie(){
    var name = "Genie";
    var color = "blue";
    var wishes = 3;

    this.grantWish = function(wish){
        console.log(wishes)
        return "Your wish is granted"
    }
}

var genie = new Genie();
```

Now I can not only hide properties, I can make as many new genies as I want!








```
var hasTicket = false;
var money = 12;
var age = 10;
var hasParent = true;

function canIGetIn() {
  if (age >= 18 || hasParent)  {
      if (hasTicket) {
        alert("Come on in!") 
      } else if (money >= 10) {
        money = money - 10;
        hasTicket = true;
        return true;
      }
  } else {
    alert("Sorry, you can't come in.")
  }
}
```


<!-- gatekeeper.admit(visitor);

gatekeeper.admit = function(visitor) {
   if (age >= 18 || hasParent)  {
      if (hasTicket) {
        alert("Come on in!") 
      } else if (money >= 10) {
        money = money - 10;
        hasTicket = true;
        alert("Come on in!") 
      }
  } else {
    alert("Sorry, you can't come in.")
  }   
}


 -->









Arrays have a `length` property.
Objects do not.

Arrays are enumerable (we can iterate or "loop" over them).
Objects are not.

But Arrays and Objects are both... Objects!

And "indexes", like "keys", are just strings!

```
var livingThings = ["ant", "bat", "cat"]
livingThings[0]; // "ant"
livingThings["0"]; // "ant"
livingThings.0; // ! SyntaxError: Unexpected number

livingThings.forEach: // function forEach() { [native code] }

livingThings.forEach(function(value, index){
    console.log(index,value);
})

// 0, "ant"
// 1, "bat"
// 2, "cat"
```

```
var livingThings = {0: "ant", 1: "bat", 2: "cat"};
livingThings[0]; // "ant"
livingThings["0"]; // "ant"
livingThings.0; // ! SyntaxError: Unexpected number

livingThings.forEach; // undefined
livingThings.forEach(); // ! TypeError: livingThings.forEach is not a function

```

So... what if we stole the forEach method from Array, and gave it to our object?

```
o = {0:"z", 1:"a", 2:"b"}; // numeric keys ("indexes")
o.length = 3; // important part
o.forEach = Array.prototype.forEach; // steal method
o.forEach(function(value, index){
    console.log(index,value);
})

// 0, "ant"
// 1, "bat"
// 2, "cat"
```