#Express

##Objectives

* Initialize an express app (20m)
* Pull information out of the req object (30m)
* Build a calculator app (30m)

##Intro

#####Express
* [Express](http://expressjs.com/) is a configurable, minimalist web framework for Node.js.

#####Goal
* Today we will be starting

##Workflow Guidelines

* Stand-up-hand-up, head to another table, high-five someone and both put your hands down. You have a partner to **pair program** with!
* The person whose name is alphabetically first will be the first navigator.

###Pair programming

* Only one computer is used at a time between two people. The person doing the coding is the **driver** the one spot checking & guiding is the **navigator**
* We will switch roles every **10m**.
* Switching roles will involve the driver pushing to Github and the navigator pulling down the changes.
  

##Project Initialization

#####Create a project directory
* `mkdir learningExpress` & `cd` into it
* touch `app.js`
* `npm init` and just press <enter> until it generates a `package.json` file for you
* Initialize git with `git init`
* Add & commit your changes

#####Initialize a Github repo
* Head to [GitHub](http://www.github.com) and click on the `+New repository` button
* Name the repo `ExpressCalculator`
* Check the box `Initialize this repository with a README`
* Add the preset `.gitignore` for Node

#####Add a collaborator
* In your new repo, click on `settings`
* In settings, navigate to the `collaborators` tab
* Search for your teammate's Github handle, to add them as a project collaborator

#####Link your local directory to your remote repo
* Point your local project repo to your remote Github repo with `git remote add origin <clone-url>`, replace with the actual `clone-url` of your project (it should end in .git)
*  Finally `git pull origin master` to merge changes locally
*  Git add, commit, and push to commit the entire repo to Github

##Using Express


#####Add express to the project

* `npm install express --save` adds Express to the project in a `node_modules` directory and saves it to the `package.json` file as a dependency.

---


---




##Notes

#####Picking partners
Standup hand-up: high-five someone, they are your partner! Partner from a diff table. Then have them make a repo together.

#####Checkins

Either choose pair to present solution

*or*

list of pain points and call on students to address them & give color

#####Timing

* Intro 10m — pair programming guidelines
* Init app — 10m work & 5m discussion
* Req obj — 20m & 10m
* Break - 10m
* Cal app — 20m & 10m 

* 85m total



#####Framing

Frame that the last exercise may not be complete
