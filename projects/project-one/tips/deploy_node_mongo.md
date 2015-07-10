## Getting set up on Heroku with Node + Mongoose

### Before you do anything
0. Your app is under version control with `git`.  If you're not sure whether your project is under version control yet, you definitely haven't been commiting often enough! But run `git status` to check if your project directory is a repo and `git init` to make it into one if necessary.
1. Make sure you have an account with heroku: https://www.heroku.com/

2. Make sure you have installed the heroku toolbelt - [https://toolbelt.heroku.com/](https://toolbelt.heroku.com/)

3. We need to add a new remote to your project repository that points to heroku's servers. **(NOTE YOUR PROJECT MUST BE A GIT REPO TO CONTINUE.)**.

	```bash
	heroku create
	```


### To start:



* Create a `Procfile` 
	- In terminal, run `touch Procfile`. Must be named with a capital P.
	- make sure it is named "Procfile" (with no extension) 
	- make sure your Procfile is in the same folder as your main server file (usually `index.js`)
	- in terminal type `echo "web: npm start" >> Procfile`


* In your `index.js` file, where you get your server started, change up the `port` argument in your `app.listen` function so that it looks for a `proccess.env.PORT` environment variable first.  Example:

```javascript
app.listen(process.env.PORT || 3000)
```

### Heroku MongoLab

In bash we want to add the following to get a Mongo database added to our Heroku project.

```bash
 heroku addons:create mongolab
```
At this point, the command line may ask you to enter a credit card number. Heroku charges for some services, or if you go over some data limits. With the tools we're using and the size of our projects' data, everything should be free.  If you had to enter in a credit card, run the `heroku addons:create mongolab` command again.



Then we want to go to our `models/index.js` file and add the following to the `mongoose.connect` method.

```javascript
mongoose.connect( process.env.MONGOLAB_URI ||
			   process.env.MONGOHQ_URL || 
			   "YOUR OWN LOCAL URL HERE")
```

And we are ready to integrate mongolab.


## Dependencies and Bower Integration

Check your `package.json` to make sure that all your depenedencies are present. If something is missing install it. For example, run the following if you're using Bower.io but don't have it listed in `dependencies`:

```bash
npm install --save bower
```


You should now add a `start` script for your application in your `package.json`.

`package.json`

```javascript
...
  "scripts": {
    "start": "node index.js",
    "postinstall": "bower install"   // <---- only need this line if you're using Bower
   }
...
```

This is assuming your main application file is called `index.js`. If your main file is called something else, adjust the script to use your file name.

## Deploying

Now that you're potentially all setup then you just need to `git add` and `commit`.


```bash
git add . -A
git commit -m "deploy attempt number"
git push heroku master
```

If you missed a step just ask for help. Otherwise you should be able to visit your application by saying the following:

```bash
heroku open
```
