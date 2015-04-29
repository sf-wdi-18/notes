# Intro DOM and Events

| Objectives |
| :---- |
| Students should be able to select elements from the DOM using selectors |
| Students should be able to add events to elements in the DOM |
| Students should be able to manage scope and control logic with the page. |


## Outline

* DOM Intro
  * Intro Chrome Console
    * Elements Tab
    * HTML Tree Structure
        * Parent / Child Relationship
  * DOM Selection
    * Selector Syntax
        * tags
        * ids
        * classes
    * Getting DOM Elements
        * `document.querySelector`
        * `document.querySelectorAll`
    * DOM Manipulation - getting / setting
      * `style`
      * `innerHTML`
      * `value`
      * `attributes`
    * `.querySelectorAll` and for-loops
  * DOM Events
    * `monitorEvents` demo
    * `onClick`
    * hovering or `mouseover`

## Intro DOM
### Nature Drawing: Trees
* Draw the structure of the wdi-sf-18 github repository
* Draw the struture of the following HTML document

```
<!DOCTYPE html>
<html>
  <head>
    <title>My Site</title>
  </head>
  <body>
    <header>
      <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/about">About</a></li>
        <li><a href="/contact">Contact</a></li>
      </ul>
    </header>
    
    <section>  
      <h1>Welcome to my site!</h1>
      <img src="/static/say_cheese.jpg">
      <p>Words and <a href="/">links</a></p>
    </section>

    <footer>
      <small>Copyright 2015 Jon Doe.</small>
    </footer>
  </body>
</html>
```

* How many children does `header` have?
* Name a direct child of the `p` element.
* Name a direct parent of the `p` element
* Name the grandparent of the `p` element

We use these words almost interchangably:

* element (an html element)
* node (a single point or branch in a tree)
* object (a collection of properties and methods)

In Javascript... **Everything is an Object!**

## DOM SELECTION

Get the element containing "Hello There":

```
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Ex 1</title>
</head>
<body>
   <div id="greeting">
     Hello There
   </div>
</body>
</html>
```

Solutions:

```
var el = document.querySelector("#greeting");
var el = document.querySelector("div");
var el = document.querySelector("div#greeting")
```

In the past you'd see alternative ways of grabbing DOM elements in javascript. *There is no good reason to use these any more*:

```
var el = document.getElementById("greeting");
var el = document.getElementByTagName("div");
var el = document.getElementByClassName("someclass")
```


## DOM Manipulation

Once you've got a DOM element, you can make all sorts of changes to it. A DOM elelement is an object, so it's got all sorts of good stuff inside of it: attributes (id, class, value, style), methods (functions)

    * change the text
    * update css styles
    * hide or delete the element
    * add additional html
    * add event listeners (click!)

We can divide our DOM manipulations into two categories: we are either "getting" or "setting".

**Examples:**

```
var element = document.querySelector("#greeting");

// get the element's color
element.style.color; // "red"

// set the element's color
element.style.color = "blue";

// get the element's font size
element.style.fontSize; // "14px"
element.style["font-size"]; // "14px"

// set the element's font size
element.style.fontSize = "20px";
element.style["font-size"] = "20px";
```

You can also grab the element's text and its "HTML String":

```
var element = document.querySelector("#greeting");

console.log(element.outerHTML); // "<div id="greeting">Hello There</div>"
console.log(element.innerHTML); // "Hello There"
console.log(element.innerText); // "Hello There"
```

**Disclaimer**: Manipulating the DOM using "vanilla" javascript can be a laborious process. We will be learning jQuery next week which will remove many of our pain points.


## DOM Elements & Loops

When you use `.querySelector` you get back a SINGLE element, the first match.

When you use `.querySelectorAll` you get back EVERY element that matches your query, in a list/array.

How would you make *many* changes to a page? With a For-Loop!

```
for(var i=0; i<elements.length; i++){
    elements[i].style.borderBottom = "2px solid black";
}
```

### Exercises

Go to the General Assembly website and open your console.

Try the following:

```
document.querySelector("h1").innerText = "CHANGE ALL THE THINGS!"
document.querySelector("h2").innerText = "(No, seriously)"
document.querySelector("a#san-francisco_cta").innerText = "CLICK ME!"
```

1. Grab the huge text splashed across the front page.
    * Get its current text.
        * Change it to "DOM Adventure"
    * Get the font size.
        * Make it tiny.
    * What color is it?
        * Make it green.
    * Change its html to include a small tag with the text "(Rated G)"
1. Turn the big red button blue.
1. Change the background of the first section heading to yellow.
1. Make the GA icon 100 pixels tall.
1. Grab the first big image on the right.
    * What is the image url?
    * Swap it for a picture of Indiana Jones.
1. Change the text of the first paragraph to: "Snakes. Why did it have to be snakes?"
    * Change the text of EVERY paragraph.

Finally: Wrap up your working code into a function called "changeAllTheThings". When you call the function, it should make all your changes to the page.



## DOM Events

**Events are always happening!**

In chrome we can use the following utility function to log events occuring in the window:

`monitorEvents(window, ["click", "keypress", "resize", "scroll"])` 

Here are some more events:

* click
* mouseenter (i.e. "hover")
* mouseleave
* load
* DOMContentLoaded
* keydown, keypress, keyup
* scroll
* resize

Events tell us lots of information, not just that a "click" occured but: where, when, what was clicked...
- x and y coordinates
- the DOM element that got clicked
- the timestamp when it happened
- and more!

**Got FOMO? Then you need event listeners.**

Let's listen for a click on a `div` on our `greeting` div:

```
document.querySelector("#greeting").onclick = function(event){
  alert("Clicked!!")
};
```

We can also listen for other types of events like hovering:

```
document.querySelector("#greeting").onmouseover = function(evt){
  alert("hovering!!")
};

```

or after we're done hover:

```
document.querySelector("#greeting").onmouseout = function(e){
  alert("read anything interesting??")
};

```


### Events and Default Behavior

Examples:

* When you submit a form, you want it to send your data somewhere.
* When you click on a link, you expect to navigate to a new page.

This is the default behavior of these events. But sometimes we want to do things differently. We need to prevent the default.

Let's say we've got a button and we want it to run some javascript instead of navigating to a new page. We have two options: `return false` or `.preventDefault()`.

```
var button = document.querySelector("a#san-francisco_cta");
button.onclick = function(evt){
    alert("If you leave the page, we failed to prevent the default link behavior")
    return false; // SUPER IMPORTANT PART
};
```

Sometimes returning false isn't an option, in which case it's better to "capture" the event object (we'll talk about this more on Thursday, for the moment it'll just feel like magic). Here's the other option:

```
var button = document.querySelector("a#san-francisco_cta");
button.onclick = function(event){
    event.preventDefault(); // SUPER IMPORTANT PART
    alert("If you leave the page, we failed to prevent the default link behavior")
};
```



### Grand Finale

Exercise:

Hijack the big button on the GA homepage! When you click the button, it should run your changeAllTheThings function WIHOUT REFRESHING THE PAGE.