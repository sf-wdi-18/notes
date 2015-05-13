#ToEat.ly: CRUDing in Single Page Applications


###Learning Objectives

| Objectives |
| :---- |
| Perform a single-page **Create** action |
| Perform a single-page **Delete** action |
| **Maintain state** between our server's data and our client's HTML |


###Starting point

You are provided with an existing express project, [ToEat.ly](https://github.com/sf-wdi-18/ToEat.ly).

Clone it down & `npm install`.

As of this morning we've accomplished one major user story thus far.

####User Story

*User should see a list of foods on the homepage*

####Sub Tasks

* Foods should be loaded asynchronously using AJAX
* Express app should render food data using JSON
* Underscore should handle the data and template it onto our homepage
* Bootstrap should be implemented to make the page presentable


##More User Stories

####In Progress

*A user can create a new food to eat*

####Backlog

*A user can delete a food from the list*

####Final Product Example

[ToEat.ly](https://toeatly.herokuapp.com/)

##User Story: Create

####Current User Story
*A user can create a new food to eat*

The above user story consists of several sub-tasks, so let's unpack those firsts.

####Story's Sub Tasks

* The page should have a form with two inputs, one for the food `name` and another for the `yumminess`
* The new food form should not submit by default, but rather send a post request to `/foods`
* The HTML page should reflect the changes, once the food is successfully POSTed


**Hints**

* Try using jQuery's `.serialize()` method to pull the information out of your form, in order for this to work properly your inputs need a `name` HTML attribute (that acts as a key)
* In order to get the POSTed data out of your `req.body`, require body-parser (we already have it, so no worries)
* Set a `food.id` property; it is recommended you increment the highest existing food.id by 1 so that there are *never* and ids that are duplicated
* At the end of the food#create route, it is good practice to respond with a JSON object of the new food just created `res.send(JSON.stringify(newFood)))`
* On your ajax function, use a `.done` to trigger a callback that updates the DOM
	* `Food.all` may be helpful, as it sends a fresh GET request to `/foods` and re-renders the HTML page with the new data.

##Delete

####Current User Story
*A user can delete a food from the list*

####Story's Sub Tasks

* Each food on the list should have an associated delete button
* The delete button should trigger a delete request to `/foods/:id`
* The delete route should find the food with the specified id and remove it from the array
* The view should update accordingly, but only once the delete is successful

**Hints**

* Only edit the HTML in your underscore template for the new delete button
* Use HTML's [data attribute](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Using_data_attributes) feature
	* a `data-id` field on the button may be helpful
	* jQuery's `.data()` can also access the data attributes
* An `onclick` directly on the delete button saves the effort of setting event listeners
* A delete request can be sent using jQuery's `.ajax()` function passing in an object that defines `url`, `type`, and `success` properties
	* The `url` property can use the `data-id` attribute to ensure each button sends a request with it's own object's id in the url
	* Similarly, in Express, a route that accepts dynamic parameters (such as `/foods/:id`) will enable a unique delete route for each food item
* The item's id can be found in `req.params.id`, which may help to retrieve it from the food array
	* Checkout underscore's `.findWhere` method )the project should already have underscore required)
* Rendering the newly deleted object as JSON in your `res.send` is best practice (you must render something for the AJAX function to continue executing)
* Finally, maintain state by re-rendering the DOM to reflect updated data on the server. Don't forget the nifty `Food.all` function!


##Phew, Well done!