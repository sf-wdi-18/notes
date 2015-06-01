# Project 1
## Pair Review

Utilize your knowledge of Mongoose, Express, AJAX, and Templating to refactor Project 1 with a partner.

| Objectives |
| :--- | 
| Identifiy & create GitHub issues for your project |
| Prioritize the issues you will address |
| Pair to refactor your code |

There are three parts to this assignment:
	1. Your project repo is on Github and has a well documented Readme.
	2. You identify/discuss/create github issues.
	3. You prioritize these issues and pair program to tackle them.

## 1. Application Overview

Go to your projects on Github. 

* Discuss what each of your applications do at a high level. This should be one or two sentences, an elevator pitch. (5m) 
* Make sure each project has a `README` that highlights these details.
	* If none exists, create one (10m)
* Is there a link on GitHub to the deployed application on Heroku?
	* If none exists, plan to deploy it later.

### Initial Models Review

Everyone should have a `User` model, and a `models` directory. Take time now to review each other's `User` model and any other models. 

* Note any additional model relationships.
	* Discuss why any relationships are there.
	* Discuss why they choose a certain type of relationship: embedded or reference.
* Note any bugs, jumbled code, or indentation problems.
	* Create a Github issue on each repository regarding model bugs or areas to be refactored.

## 2. Creating Issues
### Routing And Rendering

Review the application routes and identify those that send data to the frontend. 

* Note any bugs or areas for refactor in routing using GitHub issues.
* Can a user `Sign Up`, `Sign In`, and `Logout`?
	* What about that `secret` field for the `express-session` middleware. Is that visible on GitHub? 
* Discuss where the data is passed between the front and backend. 
* Does a user have to be signed in to view the data?
* If there is favoriting logic then discuss how that is being handled. 
	* What kind of checks are being made to see if `_id`'s or data posted to the server is being succesfully persisted?


### Validating & Sanitizing User Inputs

* Can a user signup with an illigitimate email address? How about a password less than 6 characters? Ensure you are validating this data before it is sent to the backend.
* When the data reaches the server, is the email checked for uniqueness? Does the client display error messages for the user?
* If you're templating then verify that input is being properly escaped.
	* Can one put `HTML` or `JS` into fields on your site?
		* Try signing up with a `User` that has an email like `<img src="http://onebigphoto.com/uploads/2014/04/cute-mini-lion-kitten.jpg">`.
		* Submit an issue on GitHub for any unescaped data.
	* Discuss the `<%- ... %>` vs `<%=  ... %>` in underscore or look at underscore's `escape` method.
* Are there things like `onclick` inside of the `template`? This is fine to get something up and running, but you should submit a bug for this on GitHub issues. Why? Separation of concerns is being violated `JS` event handling and `HTML` should be separated.
* Note any major layout issues on GitHub. How does it respond to resizing?

At this point you should have a wealth of issues on your project repo. Each one of these can be treated as a user story for future iterations of development.
	
## 3. Refactoring

Pick one or two major areas of refactor that you've identified in each application. This could be something like the following:

* Look at the issues already created previously for models, routing, templating, etc and consider tackling these first.
* Working on *finishing* a bug-fix or a new feature.

#### Recommended: Refactoring Secrets.

Notice for login you may have some issues.

* Your secret isn't properly hidden for `express-session`. Try using the following in your applications:
	* `dotenv` for Node and use this to hide your secrets.
	* You'll want to make sure you also have a `.gitignore` file to ignore the usual directories *and* the `.env` file.
	* Read up on `Heroku` env variables as a pair.
* Note that if you're logged in and your application goes down then you loose your session and you have to log back in.
	* Try integrating [connect-redis](https://github.com/tj/connect-redis). 
	* [Checkout redis if you're interested](http://try.redis.io/)
	* Try to `brew install redis`
