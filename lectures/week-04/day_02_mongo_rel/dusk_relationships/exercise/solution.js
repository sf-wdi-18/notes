//1) Create a user
var rob = new db.User({name: "boberto"});
rob.save();

//2) Build tweets and save them as embedded data in a user
var tweet1 = new db.Tweet({body: "shmeeshmeeshmoo"});
var tweet2 = new db.Tweet({body: "blahblahbloo"});
rob.tweets.push(tweet1, tweet2);
rob.save();

//3) List all the users
db.User.find({}, function(err, users){
  console.log(users);
});

//4) List all tweets of a specific user
db.User.findOne({name: "boberto"}, function(err, user){
  console.log(user.tweets);
});

// 5) Create several ingredients
var sauce = new db.Ingredient({title: "Tomato Sauce", origin: "Napoli"});
sauce.save();
var cheese = new db.Ingredient({title: "Parmigiano Regianno", origin: "Parma"});
cheese.save();
var sausage = new db.Ingredient({title: "Sweet Italian sausage", origion: "???"});
sausage.save()l

// 6) Create a food that references those ingredients
var pizza = new db.Food({name: "Pizza"});
pizza.ingredients.push(sauce._id, cheese._id);
pizza.save();

// 7) List all the Foods
db.Food.find({}, function(err, foods){
  console.log(foods);
});

// 8) List all the ingredients in a Food
db.Ingredient.find(
  {
    _id: {$in: pizza.ingredients}
  },
  function(err, ingredients){
    console.log(ingredients);
  }
);



















//http://stackoverflow.com/questions/8303900/mongodb-mongoose-findmany-find-all-documents-with-ids-listed-in-array