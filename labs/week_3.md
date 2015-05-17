#CatchPhrase.ly

Let's build an app for our favorite game **Catchphrase**!

This lab will span over the course of several days. The suggested workflow for each day is outlined below. We will wrap up our work on 5/18.
	
##Day 1 - Get & Render
Reference lesson: [Underscore templating](https://github.com/sf-wdi-18/notes/tree/master/lectures/week-03/day_3_todo_ajax/dawn_templating)

###User Stories
**A User should see a list of existing `phrases` on the home page**

* A phrase object should have the properties: `id`, `word`, & `definition`

* The app should hold an array of hard-coded phrases. This will serves as our "database". (You will need to make a few up!)

###General Guidelines
* Start an express project with all the necessary requirements
* Create an index (home) page
* Serve up your static assets (html, css, js) in a public directory
* Your '/phrases' route should return phrases as JSON
* Use AJAX to GET phrases
* Render the phrases on the index page using underscore templating

<br><br><br>

##Day 2 - Post & Delete
Reference lesson: [Single Page POST & DELETE](https://github.com/sf-wdi-18/notes/blob/master/lectures%2Fweek-03%2Fday_3_todo_ajax%2Fdusk%2FREADME.md)

###User Stories
**A User should be able to create a new phrase by submitting a form**

* The DOM should maintain state accordingly

* The phrase should persist with a page refresh

**A User should be able to delete any phrase**

* The DOM should update accordingly
	
* The removed phrase should remain removed upon a page refresh

###General Guidelines

* Create a form for the user to add a new catchphrase
* Send an AJAX POST with form data - if the post is successful, update the view
* Add a delete button next to each catchphrase. When a user clicks the button, delete the corresponding phrase from the backend (the ids should match). If the delete is successful, update the view.


<br><br><br>
   
##Day 3 / Weekend

We will be building the last interation of the [CatchPrase.ly App](https://github.com/sf-wdi-18/Catchphrase.ly/blob/master/README.md)!

Before you start, *make sure* you've completed Parts [1](https://github.com/sf-wdi-18/Catchphrase.ly/blob/master/README.md#day-1---get--render) & [2](https://github.com/sf-wdi-18/Catchphrase.ly/blob/master/README.md#day-2---post--delete). You *must* have routes for **Reading, Creating, and Deleting** your data.

Reference lessons: [Mongo(ose) Intro](https://github.com/sf-wdi-18/notes/blob/master/lectures%2Fweek-03%2Fday_4_mongo%2Fdawn%2FREADME.md) & [Express Implementation of Mongo](https://github.com/sf-wdi-18/notes/blob/master/lectures%2Fweek-03%2Fday_4_mongo%2Fdusk_mongo_refactor%2FREADME.md)

###Getting Started

Make sure you can successfully connect to your DB & run CRUD commands from the Node REPL / console. Please test this beforehand.

###Submission

Submit a link to the catchphrase repo on your GitHub account.

###User Stories
**Goal**: Users can see the same phrases in the application, even if the server restarts. (The phrase data is *persistent*.)

* Users should be able to see existing phrases (served from the DB) 
* Users should be able to save new phrases (permanently to the DB)
* Users should be able to delete specific phrases (from the DB)

**Bonus**: Users should be able to edit & save (update) catchphrases that are already in the DB.