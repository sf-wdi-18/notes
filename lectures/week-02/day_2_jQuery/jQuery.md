#jQuery 101

###Learning Objectives

In this session you will learn how to:

* include jQuery in a project
* add jQuery selectors to manipulate DOM elements
* bind events with jQuery
* existing knowledge to jQuery

---

###Why do we care

jQuery is a small, feature-rich JavaScript library. It makes things like DOM manipulation, event handling, animation much simpler with an easy-to-use API that works across a multitude of browsers. It allows us to write expressive code and overcome browser compatibility issues.

---

###Terminology

* Library
* CDN
* Minification
* API

---

###Library

A *library* is a collection of reusable methods 

---

###CDN

The Content Delivery Network serves distributed files to users that are visiting websites that have certain dependencies.

"A CDN" also represents a file on the network. When including jQuery into your website it is better to reference a CDN than host it on your own server for three reasons.

* Distribution
* Parallelism
* Caching

Find the jQuery CDN either by googling "JQuery CDN" or heading to [cdnjs](https://cdnjs.com/) and searching for the JS library you're looking for.

---

###Minification

In order to make the transfer of certain files quicker across the internet they are commonly minified beforehand.

Functions and variable names are shortened and the code is stripped of white spaces. A shorter file takes up less memory and, therefore, loads faster.

Non-minified file naming convention: `app.js`

Minified file naming convention: `app.min.js`

---

###Under the Hood


Let's checkout the actual raw jQuery [file](http://code.jquery.com/jquery-2.1.3.js).

Let's examine the end of this file and try to decipher what is happening with the `jQuery` / `$` object.

*Q: Qhy not just give all jQuery's functions as methods directly accessible by the window?*

---

###Documentation

It is necessary to reference the [jQuery Documentation](api.jquery.com) in order to get the most out of the library.

The website refers to its **API Documentation**.

*Q: What is an API?*

---

###APIs

An *Application Programming Interface* is a set of predefined functions that can be called on in order to execute specific commands. API's will typically have documentation outlining proper usage.

Thinking of a restaurant: the menu is the API, ordering is executing an API call, the food is your output.

---

###Example: Make Images Dissapear

Using the standard DOM API:

```
var elems = document.getElementsByTagName("img");
for (var i = 0; i< elems.length; i++) {
  elems[i].style.display = "none";
}
```

In jQuery, this is a one-liner:

```
$('img').hide()
```

---

###What Just Happened?

**Select and Manipulate:**

- Select element: `$('img')`
- Manipulate: `$('img').hide()` 

`$` - The global jQuery function. Can also be "jQuery"

`('img')` - Find DOM elements according to what's in the quotes. Returns a `jQuery collection`

`hide()` - Built-in jQuery method that operates on the collection

*Q: How would we get the images to reappear?*

---

###Selecting Elements

`$('p')`  **selects** `<p>Welcome!</p>`

`$('#main')`  **selects**  `<div id="main">Welcome!</div>`

`$('.intro')` **selects** `<p class="intro">Welcome!</p>`

`$('#main .intro')` **selects** `<div id="main"><p class="intro">Welcome!</p></div>`

---

###Challenge: Translate this code into jQuery

```
```

---

###Creating Elements

Standard DOM API

```
var p = document.createElement('p');
p.appendChild(document.createTextNode('Hello WDI!!!!!'));
p.style.cssFloat = 'left';
p.style.backgroundColor = 'red';
p.style.fontSize = '100px';
document.getElementById('header-bottom-left').appendChild(p);​
```

jQuery's API

```
var newP = $('<p>Hello WDI!!!!!</p>');
newP.css({'float': 'left', 'background-color': 'red', 'font-size': '100px'});
$('#header-bottom-left').append(newP);
```

---

###Example: Animating Elements

```
// get a list of all posts, they are in siteTable in div elements.
// Good practice: Prepend $ to indicate that it's a jQuery object.
var $allPosts = $('body #siteTable > div');

// the first is the top post, duh
var $topPost = $allPosts.first();

// Let's make sure, what's the rank?
$topPost.find('.rank').text()

// What's the title
$topPost.find('.title').text()

// Let's change it
$topPost.find('.title').text('WDI students are pretty awesome')

// And it's gone
$topPost.animate({height: 'toggle' }, 5000);

//Fade ...
$topPost.animate({ opacity: 0.25 }, 5000);
```

---
### Events

Event handling is one of the nicest aspects of jQuery because it makes the process easy and consistent across browsers. jQuery provides the high level .bind() and .unbind() functions to generically attach and detach event handlers on matched sets. In addition most of the common events like click, key and mouse events have dedicated handler functions like .click(), .mousedown(), change() and .keydown(). jQuery event handlers simply take a function as a parameter and jQuery tracks these handlers so that they can also be unbound later.

---

### Example: hover and click

```
var $allPosts = $('body #siteTable > div');

$allPosts
.not(":first")
.hover( function() {
    $(this).css({'background-color': 'red'});
})
.bind('click', function(e) {
    alert("That's Rank: " + $(this).find('.rank').text());
})
```

### [jQuery UI](http://jqueryui.com/)

---

### Challenge: Tic Tac Toe

* Include jQuery in your project
* Trade computers with someone else
* Navigate while they refactor your code
* After 15 minutes switch roles

---

###Learn More

Take some time to explore [You Might Not Need jQuery](youmightnotneedjquery.com)

We're going to use it as a learning resource to compare how we might solve a problem in jQuery vs. vanilla javascript

**For more examples, see [You Might Not Need jQuery](youmightnotneedjquery.com)**

###Ref

* [Prev Lesson](https://github.com/wdi-sf-fall/notes/edit/master/week_05_project1_week/jquery/README.md)