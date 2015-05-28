## Getting set up on Heroku with Node + Mongoose

### Before you do anything
1. Make sure you have an account with heroku: https://www.heroku.com/

2. Make sure you have installed the heroku toolbelt - [https://toolbelt.heroku.com/](https://toolbelt.heroku.com/)

3. Then create a heroku remote repo.

	```bash
	heroku create
	```


### To start:



* Create a `Procfile` 
	- In terminal, run `touch Procfile`. Must be called with a capitol P
	- make sure it is named "Procfile" (no extention) 
	- make sure your Procfile is in the same folder as your app.js file) 
	- in terminal type `echo "web: npm start" >> Procfile`


* In your `index.js` file, where you get your server started, include the port number in your app.listen function.  Example -

```javascript
app.listen(process.env.PORT || 3000)
```

### Heroku MongoLab


In bash we want to add the following to get mongo added to our project.

```bash
 heroku addons:create mongolab
```

Then we want to go to our `models/index.js` file and add the following to the `connect` method.

```javascript
mongoose.connect( process.env.MONGOLAB_URI ||
			   process.env.MONGOHQ_URL || 
			   "YOUR OWN LOCAL URL HERE")
```

And we are ready to integrate mongo.


## Adding Bower Integration

Make sure to run the following or check your `package.json` to make sure that all your depenedencies are present. If something is missing install it, e.g. run the following if you don't have `bower`:

```bash
npm install --save bower
```


You should now add a `start` script for your application in your `package.json`.

`package.json`

```javascript
...
  "scripts": {
    "start": "npm install && bower install && node index.js"
   }
...
```

This is assuming your main application file is called `index.js` if it called something else then you should adjust the script to reflect it.

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
