#jQuery 101

###Learning Objectives

* Include jQuery in a project
* Articulate the benefits of a CDN
* Articulate the value of minification
* Navigate the documents
* Translate and contrast existing knowledge to jQuery


###Why do we care about JQuery

- Cross-browser: overcomes browser compatibility issues
- Expressive: write less code & do more

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

Non-minified file convention: `app.js`

Minified file convention: `app.min.js`

---

###Under the Hood


Let's checkout the actual raw jQuery [file](http://code.jquery.com/jquery-2.1.3.js) we've just loaded.

Essentially what's happening in this file functions are being attached to a JQuery object. This object is then set equal to `window.$` & `window.jQuery`.

Question: why not just give all jQuery's functions as methods directly accessible by the window? 

---

###JQuery's API

jQuery's website refers to its **API Documentation**.

Question: What is an API?

---

###Documentation

It is necessary to reference the [jQuery Documentation](api.jquery.com) in order to navigate jQuery's API you'll have to either get good at searching for what you're looking for or navigate the lefthand side-panel.

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


### example: change a bunch of elements to be blue

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