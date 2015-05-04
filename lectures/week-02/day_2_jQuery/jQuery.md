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

A *library* is a collection of reusable methods organized together to solve problems of a specific domain.

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

###Example: Make Images Disappear

Using the standard DOM API:

```
var elems = document.getElementsByTagName("img");
for (var i = 0; i< elems.length; i++) {
  elems[i].style.display = "none";
}
```

In jQuery, this is a one-liner:

```
$('img').hide();
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

##Selectors

`$('p')`  **selects** `<p>Welcome!</p>`

`$('#main')`  **selects**  `<div id="main">Welcome!</div>`

`$('.intro')` **selects** `<p class="intro">Welcome!</p>`

`$('#main .intro')` **selects** `<div id="main"><p class="intro">Welcome!</p></div>`

---

###Challenge: Translate to jQuery

On [reddit](www.reddit.com) perform the following using jQuery instead:

#####Change All Headlines

```
var headlines = document.querySelectorAll(".title");
for (var i = 0; i < headlines.length; i++) {
  headlines[i].innerText = "WDI Rules";
}
```

#####Redirect to Digg
```
var logo = document.querySelector("#header-bottom-left a");
logo.href = "http://www.digg.com";
```

#####Start Searching
```
var searchBox = document.querySelector("#search input");
searchBox.value = "BsS";
```

---

##Element Creation

Standard DOM API

```
var p = document.createElement('p');
p.appendChild(document.createTextNode('Hello WDI!!!!!'));
p.style.cssFloat = 'left';
p.style.backgroundColor = 'red';
p.style.fontSize = '100px';
var logo = document.querySelector('#header-bottom-left')
logo.appendChild(p)
```

jQuery's API

```
var newP = $('<p>Hello WDI!!!!!</p>');
newP.css({
	'float': 'left',
	'background-color': 'red',
	'font-size': '100px'
});
$('#header-bottom-left').append(newP);
```

---

###Challenge: Translate to jQuery

#####Clone and insert a new button
```
var btn = document.querySelectorAll(".spacer")[2];
var newBtn = btn.cloneNode(true);
var anchorChild = newBtn.children[0].children[0].children[0];
anchorChild.text = "Party like it's 1999";
btn.appendChild(newBtn);
```

---

## [Events](http://api.jquery.com/category/events/)

jQuery makes event handeling easy and consistent across browsers. Events such as `.click()`, `.mousedown()`, `.change()`, `.keydown()`, etc, simply take a function as a parameter. Otherwise use `.bind()` and specify the event and function.

### Example: Hover and Click Events

```
var allPosts = $("body #siteTable > div");
allPosts
.not(":first")
.hover( function() {			//using the event as the function
    $(this).css({"background-color": "orange"});
})
.bind("click", function() {	//using bind and passing in an event
	var rank = $(this).find(".rank").text();
    alert("That's Rank: " + rank);
})
```

##[Animations](http://api.jquery.com/animate/)

We can use `.animate()`, which takes an object and a time (in milliseconds) and will change the existing css to the one passed in that amount of time. See example below. 

```
// Good practice: Prepend $ to indicate that it's a jQuery object
var $allPosts = $('body #siteTable > div');

// the first is the top post
var $topPost = $allPosts.first();

// Let's find the rank
$topPost.find('.rank').text();

// & the title
$topPost.find('.title').text();

// Change it!
$topPost.find('.title').text('WDI students are pretty awesome');

// Collapse the search bar
$("#search").animate({width: '100px'}, 5000)

//Fade out...
$topPost.animate({ opacity: 0.25 }, 5000);
```

---

##[Plugins](https://learn.jquery.com/plugins/)

Plugins are "to extend jQuery's prototype object. By extending the prototype object you enable all jQuery objects to inherit any methods that you add." These plugins are open source and there are many of them to accomplish most needs you can think of. On your own spend time exploring what's out there!

---

##[jQuery UI](http://jqueryui.com/)

jQuery's UI library are a set of plug-and-play widgets that accelerates certain aspects of development. Widgets include date-pickers, menus, progress bars, spinners, accordions, etc. Feel free to explore these on your own time.

---

### Challenge: Tic Tac Toe (time permitting)

* Include jQuery in your project
* Trade computers with someone else
* Navigate while they refactor a piece of your code (don't overwrite, just comment out)
* After 15 minutes switch roles

---

###Learn More

Take some time to explore [You Might Not Need jQuery](youmightnotneedjquery.com) to see side-by-side examples of the DOM's API vs jQuery's API.