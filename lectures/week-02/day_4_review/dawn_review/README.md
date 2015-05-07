# More JS
## Review


| Objectives |
| :--- |
| Review and apply Object Oriented principles and methods in JavaScript |
| Discuss and apply jQuery patterns to solve common problems. |
| Utilize Node and NPM to play with code and packages. |


## Roadmap


* Intro to Bower
* Review of jQuery
* Review of prototypes
	* Construction function 
	* Methods, properties and prototypes... oh my!
* Review of inheritance
	* Dryer code


## Getting Started

Make a project directory for the exercises today.


```
mkdir review_exercises
cd review_exercises
touch index.html
mkdir javascripts
mkdir stylesheets
mkdir images
```

and some boilerplate for your html

```
<!DOCTYPE html>
<html>
<head>
  <title>Examples</title>
  <script src="javascripts/app.js"></script>
</head>
<body>
	<div id="rave"></div>
</body>
</html>

```

Add the following to the `javascripts/app.js` file.

```
window.addEventListener("load", function () {
	alert("loaded");
});
```

Open the `index.html` to verify it's working.

## Node Review

You can use Node to install a tool called **Bower**. It's a simple tool that helps you download packages for your frontend. You can use **Bower** to download jQuery, Bootstrap, and all the libraries you could want.


```
npm install -g bower
```

and let's start by installing jQuery

```
bower install jquery
```

notice there is now a `bower_components` folder with jquery inside. Now all we have to do is add a script tag to our page.


```
	<script type="text/javascript" src="bower_components/jquery/dist/jquery.min.js"></script>

```

Make sure that the above script is loaded above your `javascripts/app.js` file. Then try the following jQuery refactor.


```
$(document).on("ready", function () {
	alert("loaded!");
});
```


## jQuery Review


We want to build up toward the idea of a prototype. Let's begin with our knowledge of jQuery and see if we can't refactor until we end up with something that we can use to turn into a prototype. 


### The Three Rules Of jQuery `$`

* If you give the `$` symbol something that looks like a selector it will find it for you. 

	```
	$("#blah") // => finds element with id blah
	```
* If you give the `$` symbol something that looks like HTML it will then turn it into HTML elements.

	```
	var $myDiv = $("<div>Hello world</div>");
	$myDiv.css("backgroundColor", "blue");
	$("body").append($myDiv);
	```
* If you give the `$` symbol a `function` then it will run that function after the document is loaded.

	```
	window.addEventListener("load", function () {
		alert("loaded!");
	});
	```
	
	becomes
	
	```
	$(function () {
		alert("loaded!");
	});
	```




### Exercise Rules

Use jQuery to try the following:

### Stage 1

* Select the `#rave` from the page and change it's background color to `"rgb(0, 0, 255)"`. Change the `width` and `height` of the div to `100px`.
* Create a button called `Less Blue` inside the `#rave` element. Give it a `.lessBlue` class. Add a click event for the button. When clicked it should decrease the `rgb` of the `#rave` element by `5`. Hint:  create variable called `raveRGB` to save the current `RGB`. **Discuss in your groups if an array, string, or object works best.**.
* **BONUS**: Remove your HTML for the `#rave` element and it's button. Use jQuery to create and append the same HTML to the `body` of the document.


### Stage 2

* **Refactor:** let's get rid of our `Less Blue` button. Instead create a form with id `colorDetails`. Give the `colorDetails` form three inputs. Use the `change` event to listen for when the form *changes*. When the form changes `console.log` the `event.target.value` and `event.target.id`. **Discusss in your groups how you can use this to update the `backgroundColor` of the `colorDetails`.**
* **Refactor:** take the logic for updating your background-color and put it into a function called `setColor`.
* **Feature Creep**: create a button inside your `#rave` with id of `toggleDetails`. When the `#toggleDetails` button is clicked you should show/hide the `colorDetails` form. 
	* NOTE: due to the performance problems of using **jQuery's** built-in show/hide methods try toggling a class of `hidden`.
* **BONUS** use jQuery instead of HTML to both create the `#rave` element and the `colorDetails`.

## Prototypes Review

Discuss the following in groups:

* What is a constructor?
	* What is a property?
	* What is a method? 
	* What is a `hasOwnProperty`?
* What is a prototype? 
* Why use a prototype?

Let's assume we have some code after Stage 2 that looks kind of like the following:

```
// wait for DOM to finish
$(function () {

	var $raveEl = $("#rave");
	var raveColors = {
						red: 255,
						green: 255,
						blue: 255
					};
	
	var setColor = function (key, val) {
		raveColors[key] = val;
		
		var rgbStr = "rgb(" + 
					  raveColors.red + ", " +
					  raveColors.green + ", " +
					  raveColors.blue + ")";
		$raveEl.css("backgroundColor", rgbStr);
		
		return $raveEl;				
	};
	
	$("#colorDetails").on("change", function (e) {
		setColor(e.target.id, e.target.value);
	});

});
```

or if you create the `raveEl` with jquery you have the following.


```


$(function () {

	var $raveEl = $("<div id='rave'>");
	$raveEl.css({
		width: "100px",
		height:  "100px"
	});
	
	var $colorDetails = $("<form id='colorDetails'>")
	$colorDetails.append("<input id='red'>")
				  .append("<input id='green'>")
   	  		      .append("<input id='blue'>");
	
	$raveEl.append($colorDetails);
	$("body").append($raveEl);
	
	var raveColors = {
						red: 255,
						green: 255,
						blue: 255
					};
	
	var setColor = function (key, val) {
		raveColors[key] = val;
		
		var rgbStr = "rgb(" + 
					  raveColors.red + ", " +
					  raveColors.green + ", " +
					  raveColors.blue + ")";
		$raveEl.css("backgroundColor", rgbStr);
		
		return $raveEl;				
	};
	
	$("#colorDetails").on("change", function (e) {
		setColor(e.target.id, e.target.value);
	});

});


```

However, what happens if we want to create multiple little rave elements that people can play with? Right now our code only allows for one. Our code is going to need a serious refactor. The first part of our code seems deticated to creating a `$raveEl`, so lets put it into a method called  `createEl`.

```

var createRave = function () {
	var $raveEl = $("<div id='rave'>");  
	$raveEl.css({						
		width: "100px",
		height:  "100px"
	});
	
	var $colorDetails = $("<form id='colorDetails'>")
	$colorDetails.append("<input id='red'>")
				  .append("<input id='green'>")
   	  		      .append("<input id='blue'>");
	
	$raveEl.append($colorDetails)
	$("body").append($raveEl);
	
	return $raveEl;
};

```

Now we have to use this in our code.


```



$(function () {

	var $raveEl = createRave();
	
	var raveColors = {
						red: 255,
						green: 255,
						blue: 255
					};
	
	var setColor = function (key, val) {
		raveColors[key] = val;
		
		var rgbStr = "rgb(" + 
					  raveColors.red + ", " +
					  raveColors.green + ", " +
					  raveColors.blue + ")";
		$raveEl.css("backgroundColor", rgbStr);
		
		return $raveEl;				
	};
	
	$("#colorDetails").on("change", function (e) {
		setColor(e.target.id, e.target.value);
	});

});


```

Now this might seem fine, but we aren't done here yet. the `setColor` function still relies on the `$raveEl` and the `raveColors` are all related to our `raveEl`. The best thing to do here is to realize that they all share this commonality. Now we can use a prototype to clean it up.


* The **createRave** code constructs a new raveEl, so it looks like a great candiate for a constructor function.
* The **raveColors** object seems like a record of the colors belonging to the `raveEl` so it might be best to make that a property.
* The **setColor** function looks like a setter.


```


function RaveDiv() {
	this.colors = {
						red: 255,
						green: 255,
						blue: 255
					};
	
	
	return this;
};


RaveDiv.prototype.setColor = function (key, val) {
	this.colors[key] = val;
	
	var rgbStr = "rgb(" + 
				  raveColors.red + ", " +
				  raveColors.green + ", " +
				  raveColors.blue + ")";
				  
	this.$raveEl.css("backgroundColor", rgbStr);
	
	return this;		
};
	


```


Now we can just use this prototype for a `RaveDiv` as needed.

```

$(function () { 
	var myRave = new RaveDiv();
	
	myRave.$colorDetails.on("change", function (e) {
		myRave.setColor(e.target.id, e.target.value);
	});
})

```

### Exercises

* Refactor you constructor move a lot of the construction process into a `setup` method.

	```
	RaveDiv.prototype.setup = function () {
		var $raveEl = $("<div id='rave'>");  
		$raveEl.css({						
			width: "100px",
			height:  "100px"
		});
		
		var $colorDetails = $("<form id='colorDetails'>")
		$colorDetails.append("<input id='red'>")
					  .append("<input id='green'>")
	   	  		      .append("<input id='blue'>");
		
		$raveEl.append($colorDetails)
		$("body").append($raveEl);
		
		this.$raveEl = $raveEl;
		this.$colorDetails = $colorDetails;
	};
	
	
	```

* Make a button in the HTML with id `addRave`. When clicked create a new `RaveDiv`, and listen for changes to its `colorDetails`.

* Clean up the `setColor` method by turning the following code into a `renderColor` method.

	```
	var rgbStr = "rgb(" + 
					  raveColors.red + ", " +
					  raveColors.green + ", " +
					  raveColors.blue + ")";
					  
		this.$raveEl.css("backgroundColor", rgbStr);
	```

* Clean up the `renderColor` method by turning the following code into a `getRGBStr` method.

	```
		var rgbStr = "rgb(" + 
					  raveColors.red + ", " +
					  raveColors.green + ", " +
					  raveColors.blue + ")";
					  
	```

* Add a method called `resetColors` that sets `red`, `green`, and `blue` to `255` and renders them. Add a button in the setup called `reset` to the form. Use `preventDefault` when it is clicked.






