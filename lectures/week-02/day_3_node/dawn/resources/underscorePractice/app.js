var _ = require('underscore');

//EACH
var names = ["nathan", "del", "ilias"];
var uppcaseName = function(name) {
  var upcasedName = name[0].toUpperCase() + name.slice(1);
  console.log("upcased each name to: ", upcasedName);
  return upcasedName;
}
_.each(names, uppcaseName); //pass names & callback into each

//MAP
var oneToThree = [1,2,3];
var newArry = _.map(oneToThree, function(num){  //anonymous function
  return num * num;
})
console.log("mapped squares: ", newArry);     //[1,4,9]

// //FILTER
var evens = _.filter([1, 2, 3, 4, 8], function(num){ 
  return num % 2 == 0;
});

debugger;
console.log("filtered evens: " + evens);