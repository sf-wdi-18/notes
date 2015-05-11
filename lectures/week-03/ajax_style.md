# jQuery AJAX
## Style Guide


## Variable Naming

* It is best practice to either **prefix** or **postfix** variable names that refer to jQuery objects with a `$` symbol.

```
var myTitle = $("h1#title"); // bad
var $myDiv = $("div#greeting"); // good;
var myTotal$ = $("div#total"); // okay
```

Note: don not go wild and just add `$` symbols to every variable

```
var $myNum = 1; // bad
```

## Three Rules Of `$`

* If you give the `$` an HTML like string it will return a jQuery wrapped collection of elements that represent it.

```
var $myDiv = $("<div>Hello World</div>");
```

That would be the equivalent of writing out something like the follwoing:

```
var myDiv = document.createElement("div");
var innerText = document.createTextNode("Hello World");
myDiv.appendChild(innerText);
```












