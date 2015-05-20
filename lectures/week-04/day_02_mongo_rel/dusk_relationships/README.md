#Relationships in Mongo


##Learning Objectives

| Objectives |
| :---- |
| Gain a deeper understanding of Mongo's ability to handle relationships |
| Compare and contrast embedded & referenced data |
| Design routes for nested resources |
| Build the appropriate queries for nested relationships |

##Relationships in Mongo

There are more than one way to form relationships in Mongo...

####Embedded Data

* **Embedded Data** is directly nested *inside* of other data

####Referenced Data

* **Referenced Data** contains an *id* that can be used to lookup the information

There is a tradeoff between *efficiency* and *consistency* depending on which one you choose.

###Scenario: 

How would you design the following?

* A `User` that has many `Tweets`?
* A `Food` that has many `Ingredients`?


###Implementing each

Tip: Noteworthy code lines are denoted with `NOTE` in the comments.

**Referencing Data**

```javascript
var foodSchema = new Schema({
  name: {
    type: String,
    default: ""
  },
  ingredients: [{
    type: Schema.Types.ObjectId,	//NOTE
    ref: 'Ingredient'
  }]
});

var ingredientSchema = new Schema({
  title: {
    type: String,
    default: ""
  },
  origin: {
    type: String,
    default: ""
  }
});
```

**Embedding Data**
z
```javascript
var tweetSchema = new Schema({
  body: {
    type: String,
    default: ""
  }
});

var userSchema = new Schema({
  username: {
    type: String,
    default: ""
  },
  tweets: [tweetSchema]		//NOTE
});
```

##Route Design

In order to *read* & *create* nested data we need to design appropriate routes.

The most popular, modern convention is RESTful routing. Here is an example of an application that has routes for `Store` and an `Item` models:

####RESTful Routing
|| | |
|---|---|---|
| **HTTP Verb** | **Path** | **Description** |
| GET | /store | Get all stores |
| POST | /store | Create a store |
| GET | /store/:id | Get a store |
| DELETE | /store/:id | Delete a store |
| GET | /store/:store_id/items | Get all items from a store |
| POST | /store/:store_id/items | Create an item for a store |
| GET | /store/:store_id/items/:item_id | Get an item from a store |
| DELETE | /store/:store_id/items/:item_id | Delete an item from a store |

*In routes resources should not be nested more than one level deep*

##Queries Exercise

#####Goal

Create and navigate through relational data in MongoDB

#####Setup
* startup mongoDB with `mongod`
* `cd` into the folder `exercise` in this directory
* `node console.js` to enter into a REPL where you can interact with you DB

#####Tips
* save your successful code in Sublime for each step
* all your models will be inside an object `db`
* inspect `models.js` to understand what properties each model has


#####Steps

	1) Create a user
	
	2) Create tweets embedded in that user
	
	3) List all the users
	
	4) List all tweets of a specific user
	
	5) Create several ingredients
	
	6) Create a food that references those ingredients
	
	7) List all the Foods
	
	8) List all the ingredients in a Food
