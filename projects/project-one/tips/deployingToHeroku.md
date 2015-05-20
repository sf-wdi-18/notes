## Getting set up on Heroku with Node + Sequelize 

### Before you do anything
1. Make sure you have an account with heroku: https://www.heroku.com/

2. Make sure you have installed the heroku toolbelt - [https://toolbelt.heroku.com/](https://toolbelt.heroku.com/)

### To start:


* Create a `Procfile` 
	- In terminal, run `touch Procfile`. Must be called with a capitol P
	- make sure it is named "Procfile" (no extention) 
	- make sure your Procfile is in the same folder as your app.js file) 
	- in terminal type `echo "web: node app.js" >> Procfile`



* In your `app.js` file, where you get your server started, include the port number in your app.listen function.  Example - 
```
app.listen(process.env.PORT || 3000)
```

this ensures that when we set the PORT config variable, heroku will run on it (we will set the PORT to 80 for heroku)

* Your package.json file is __crucial__ - when you deploy your application, heroku will check the package.json file for all dependencies so whenever you install anything with npm make sure to use --save. You can always check your package.json to see if you are missing anything. *

Please add...
```bash
$ npm install --save sequelize-cli
```

* Create a heroku app via the command line
```
heroku apps:create example
```
Where `example` is the name of your app. This will create a url like: `http://example.herokuapp.com`

* Commit and push all your data at this point.

* To push to heroku, enter the following command
```
git push heroku master
```

* In terminal after you deploy your app, type in `heroku ps:scale web=1 `
* If there are no errors, check out your app by going to the url provided at the end of the push or type in ```heroku open```


## Connect a DB with Sequelize
(this should be done ONLY after you have set up your local database and ran all migrations successfully):


* In terminal, install the add-on for postgres
    ``` heroku addons:add heroku-postgresql:dev```
  
* Set your NODE_ENV variable to 'production' by running this command in terminal: ```heroku config:set NODE_ENV='production' ``` 
* Make sure your production variables in config.json are set like this
  
  ```
"production": {
        "use_env_variable": "DATABASE_URL"
}
```

Sequelize needs special configuration for use on Heroku. We need to modify party of `/models/index.js` to handle these changes.

To make your app aware of the heroku database settings we need to insert a line in `models/index.js` direct after this line...

```
var config = require(__dirname + '/../config/config.json')[env];
```

add...

```
// NEEDED FOR HEROKU ///////////
if(config.use_env_variable){
  var db_info = process.env[config.use_env_variable].match(/([^:]+):\/\/([^:]+):([^@]+)@([^:]+):(\d+)\/(.+)/);
  config.dialect=db_info[1];
  config.username=db_info[2];
  config.password=db_info[3];
  config.host=db_info[4];  
  config.port=db_info[5];  
  config.database=db_info[6];  
}
//////////////////////////////
```


* Add and commit your changes using `git commit -am "adding production db"` and then push your changes to heroku using `git push heroku master`

* Now run your migrations by typing in terminal ``` heroku run node_modules/.bin/sequelize db:migrate``` and you should have all your tables set up in a heroku hosted database

* Try opening your app now, `heroku open`
