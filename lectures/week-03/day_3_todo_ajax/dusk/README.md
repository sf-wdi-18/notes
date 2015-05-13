#ToEat.ly: CRUDing in Single Page Applications


###Learning Objectives

| Objectives |
| :---- |
| Perform a single-page **Create** action |
| Perform a single-page **Delete** action |
| **Maintain state** between our server's data and our client's HTML |


###Starting point

You are provided with an existing express [project](), clone it down & `npm install`. As of this morning we've accomplished one major user story thus far.

####User Story

*User should see a list of foods on the homepage*

####Sub Tasks

* Foods should be loaded asynchronously using AJAX
* Express app should render food data using JSON
* Underscore should handle the data and template it onto our homepage
* Bootstrap should be implemented to make the page presentable


##More User Stories

####In Progress

*A user can submit a new food to eat*

####Backlog

*A user can delete a food from the list*

####Final Product Example

[ToEat.ly](https://toeatly.herokuapp.com/)

##Create

####Current User Story
*A user can submit a new food to eat*

The above user story consists of several sub-tasks, so let's unpack those firsts.

####Story's Sub Tasks

* The page should have a form with two input, one for the food `name` and another for the `yumminess`
* The new food form should not submit by default, but rather sends a post request to `/foods`
* The HTML page should reflect the changes, once the food is successfully POSTed


**Hints**

* Try using jQuery's `.serialize()` method to pull the information out of your form, in order for this to work properly your inputs need a `name` HTML attribute (which acts as a key)
* You will need to require `body-parser` in order to get the POSTed data out of your `req.body` (we already have it, so no worries)
* Set a `food.id` property; it is recommended you increment the highest existing food.id by 1
* In at the end of the route you use to create a new food, it is good practice to respond with a JSON object of the new food just created `res.send(JSON.stringify(newFood)))`
* Use a `.done` to trigger a function that updates the DOM. `Food.all` is helpful, as it sends a fresh GET request to `/foods` and re-renders the HTML page with the new data.

##Delete

####Current User Story
*A user can delete a food from the list*

####Story's Sub Tasks

* Each food on the list should have an associated delete button
* The delete button should trigger a delete request to `/foods/:id`
* The delete route should find the food with the specified id and remove it from the array
* The view should update accordingly, only once the delete is successful

**Hints**

* Add a delete button to your underscore template
* Set a [data attribute](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Using_data_attributes) named `data-id` on the button
* Use jQuery's `.data()` to access the data attributes
* Use an `onclick` for the delete button
* Send the delete request using jQuery's `.ajax()` function passing in an object that defines `url`, `type`, and `success` properties
* Your `url` property will use the `data-id` attribute to ensure each button sends a request with it's own object's id in the url
* In your express application, ensure your delete route can accept dynamic parameters with by using a `:`, such as `/foods/:id`
* Use the `req.params.id` to search through your foods array
	* To do this checkout underscore's `.findWhere` method (you may need to require underscore, though we should already have it)
	* Unexpected behavior may mean there is a datatype issue
* Render the deleted object as JSON in your `res.send` at the end of the controller, you must render something for the AJAX function to continue executing & this pattern is best practice
* Finally, maintain state by re-render the DOM based on the updated data on the server. Don't forget the nifty `Food.all` function!


##Phew, Well done!