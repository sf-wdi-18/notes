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

Question: why not just give all jQuery's functions as methods directly accessible by the window? 

---

###Documentation

It is necessary to reference the [jQuery Documentation](api.jquery.com) in order to get the most out of the library.

The website refers to its **API Documentation**.

Question: What is an API?

---

###APIs

An *Application Programming Interface* is a set of predefined functions that can be called on in order to execute specific commands. API's will typically have documentation outlining proper usage.

Thinking of a restaurant: the menu is the API, ordering is executing an API call, the food is your output.

---





###jQuery Selectors

Translate this code to jQuery:

* //select an element
* //change it's content
* //insert an element
* //delete an element

---

###Challenge: Translate to jQuery

In pairs reference the to 

---

###Javascript vs. jQuery



Compare and contrast:

| Goal | javascript | jQuery |
| ---- |:-----------|:-------|
| Get element | `document.querySelector('#this-one');` | `$('#this-one');` |
| Get elements | `document.querySelectorAll('button');` | `$('button');` |
| get css styles | `el.style;` | `el.css();` |
| get css style | `el.style.color;` | `el.css("color");` |
| set css style | `el.style.color = "blue";` | `el.css("color", "blue");` |
| get attribute | `el.type;` | `el.attr("type");` |
| set attribute | `el.type = "button";` | `el.attr("type", "button");` |


### Example: change a bunch of elements to be blue

**JavaScript**

```
var buttons = document.querySelectorAll("button")

for(var i=0; i<buttons.length; i++) {
    buttons[i].style.background = "blue";
    buttons[i].style.color = "white";
}

```

**jQuery**

```
$("button").css("background", "blue").css("color", "white")

// or

$("button").css({"background": "blue", "color": "white"})
```

###Example: hide and show elements

**JavaScript**

```
// hide
document.querySelector("div").style.display = "none";

// show
document.querySelector("div").style.display = ""; //!
// Oh no! Was it "block", "inline", or "inline-block"?

```

**jQuery**

```
$("button").hide();
$("button").show(); // jquery takes care of it for you!
```
---

###Load events

###Learn More

Take some time to explore [You Might Not Need jQuery](youmightnotneedjquery.com)

We're going to use it as a learning resource to compare how we might solve a problem in jQuery vs. vanilla javascript

**For more examples, see [You Might Not Need jQuery](youmightnotneedjquery.com)**