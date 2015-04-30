# Intro JS
## DOM & Context

| Objectives |
| :--- |
| Review and apply setting up common event handlers. |
| Apply and discuss context switching with DOM events |
| Explain scoping and functional abstraction with the DOM. |

## Background

We previously discussed what the DOM is and  explored how to select elements from it.

Take this html

`index.html`

```
<!DOCTYPE html>
<html>
  <head>
    <script src="app.js"></script>
  </head>
  <body>
    <button id="greet">Greet</button>
  </body>
</html>

```

and the corresponding JS.

`app.js`

```

var greet = document.querySelector("#greet");

greet.onclick = function (event) {
  alert("Hello, world");
};

```

## `#addEventListener`

Having only the `.onclick` for the `greet` element we can only ever have **one** thing happen when a element is clicked. 

> This is problematic when you have a group of people working on the same codebase, where a single element may play multiple roles.


Let's practice with the following example. Open up a new folder in sublime.

```
mkdir event_examples
cd event_examples
touch index.html
touch app.js
subl .
```

Let's use the familiar HTMl

`index.html`

```
<!DOCTYPE html>
<html>
  <head>
    <script src="app.js"></script>
  </head>
  <body>
    <button id="greet">Greet</button>
  </body>
</html>

```

and the corresponding JS.

`app.js`

```

var greet = document.querySelector("#greet");

greet.addEventListener("click", function (event) {
  alert("Hello, world");
});

greet.addEventListener("click", function (event) {
  alert("Meow!");
});


```

## The `load` Event

If you try to write JavaScript to grab elements before the page has finished loading then you are going to get an error. **All the work you do with DOM events requires you to wait for the window to be loaded**.


Hence it will be critical for us to wrap all of our code in  the following:

```
window.addEventListener("load", function (){
	// your work here.
});
```


## Targets

With each event in the DOM there is a `target`. For example, when a user clicks an image the `target` would be the image that was actually clicked. 


### Simple Target


`index.html`

```

<!DOCTYPE html>
<html>
  <head>
    <script src="app.js"></script>
  </head>
  <body>
	<img id="kittenPic" src="http://petnamesplace.com/wp-content/uploads/2009/12/kitten-names-copy.jpg"></img>
  </body>
</html>

```


and the following JS.

`app.js`

```

var kitten = document.querySelector("#kittenPic");

kitten.addEventListener("click", function (event) {
	console.log(event.target);
})

```


### Bubbling Event

This might seem very straight forward, but in reality the `event.target` is not always the that is currently recieving a click.


`index.html`

```
<!DOCTYPE html>
<html>
  <head>
    <script src="app.js"></script>
  </head>
  <body>
  	<div id="kittenCon">
		<img id="kittenPic" src="http://petnamesplace.com/wp-content/uploads/2009/12/kitten-names-copy.jpg"></img>
	</div>
  </body>
</html>

```



`app.js`

```

var kittenContainer = document.querySelector("#kittenCon");

kittenContainer.addEventListener("click", function (event) {
    console.log(this);
	console.log(event.target);
})

```


The thing to note here is that that when we click the image we also click the `<div>` containing that image. 



## Exercises

**FOR ALL OF THE FOLLOWING EXERCISES BE SURE TO WRAP YOUR JS IN THE FOLLOWING:**

```
window.addEventListener("load", function () {
	// your code
})
```

Use the following HTML and CSS.

`color_changer.html`

```
<!DOCTYPE html>
<html>
	<head>
		<style>
			.greetingCon {
				position: absolute;
				padding: 20px;
				background-color: gray;
			}
			
			#greeting {
				position: relative;
			}
		</style>
	</head>
	<body>
		<div id="greetCon" class="greetingCon">
			<div id="greeting">
				Hello, world!
			</div>
		</div>
	</body>
</html>

```


----

### Clicking Colors

1. Changing colors, grab the `#greetCon` div from the DOM, and set a `click` handler to change the color of the element to `red`.
2. Use the following function to update the color of your `#greet` div to `"red"`.

	```
	var getColor = function () {
		return 'rgb(255, 0, 0)';
	};
	
	```
3. Right now our `getColor` function is pretty static. Let's generate a random integer between `0` to `255` to use as our `red` coloring.

	```
	var getColor = function () {
		// your work
		return 'rgb(' + randNum + ', 0, 0)';
	};	
	```
4. Use your code for generating a random number to write a `randVal` function that returns a random number from `0` to `255`. Then use it in your `getColor` function.

	```
	var randVal = function () {
		// your code here
		
		return num;
	};
	```

	Use the above in the `getColor` function.
	
	```
	var getColor = function () {
		return 'rgb(' + randVal() + ', 0, 0)';
	};
	```

5. Currently, our `getColor` function returns `255` shades of red. Make it generate a random color. using your existing functions.


------

### Using Scope


Use the following HTML and CSS.



`img_changer.html`

```
<!DOCTYPE html>
<html>
	<head>
		<style>
		.imgCon {
		  border: 1px solid black;
		  height: 500px;
		  width: 500px;
		  overflow-y: hidden;
		}
		</style>
	</head>
	<body>
      <div class="imgCon">
      	<img id="displayImg" src="">
      </div>
	</body>
</html>

```

Select the `#displayImg` from the page, and use the following image sources to complete the exercises.

```
var images = [
  "http://ochumanesociety.com/clients/3697/images/kittens.jpg",
  "http://wallbervation.com/wp-content/uploads/2015/03/Kittens-2.jpg",
  "http://www.lovethispic.com/uploaded_images/90725-Colorful-Kittens.jpg"
 ];
```

1. Select the `.imgCon` and set a click handler to change the `#displayImg` source to one of the `images` urls.

2. Modify your `.imgCon` click handler to cycle through the `images` sources displayed in the `displayImg`.

----


 Use the following HTML and CSS.
 
 ```
<!DOCTYPE html>
<html>
  <head>
    <style>
      .colorBox {
        border: solid 1px black;
        height: 75px;
        width: 75px;
      }
    </style>
  </head>
  <body>
    <div class="colorBox">
    </div>
    <ul id="colorPicker">
      <li>red</li>
      <li>green</li>
      <li>blue</li>
    </ul>
  </body>
</html>
 ```
 
### Using Targets 
 
1. Grab `#colorPicker` from the page. Then set a click handler on it to log the `event.target`.
2. Change the `backgroundColor` of the `.colorBox` to the `innerHTML` of the `event.target`.


----





