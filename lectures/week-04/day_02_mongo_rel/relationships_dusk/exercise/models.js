// Setup
var mongoose = require("mongoose");
mongoose.connect("mongodb://localhost/mongoRelationships");
var Schema = mongoose.Schema;

// Referenced Data
var foodSchema = new Schema({
  name: {
    type: String,
    default: ""
  },
  ingredients: [{
    type: Schema.Types.ObjectId,
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
})


var Food = mongoose.model("Food", foodSchema);
var Ingredient = mongoose.model("Ingredient", ingredientSchema);

// Embedded Data
var tweetSchema = new Schema({
  body: {
    type: String,
    default: ""
  }
});

var userSchema = new Schema({
  name: {
    type: String,
    default: ""
  },
  tweets: [tweetSchema]
});


var User = mongoose.model("User", userSchema);
var Tweet = mongoose.model("Tweet", tweetSchema);



// Export
exports.Food = Food;
exports.Ingredient = Ingredient;
exports.User = User;
exports.Tweet = Tweet;

// Close connection on close
process.on('SIGINT', function() {
  console.log('About to exit...');
  mongoose.disconnect(function(){
    console.log("Disconnected DB")
    process.exit(); // now exit the node app
  });
});