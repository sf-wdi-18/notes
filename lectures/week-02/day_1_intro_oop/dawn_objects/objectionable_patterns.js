// As developers we sometimes make poor choices in how we structure our data. Refactor the following using objects to clean up the code.

//////////////////////////////
// ANTIPATTERNS - Example 1 //
//////////////////////////////

var hasTicket = false;
var money = 12;
var age = 10;
var hasParent = true;

function canIGetIn() {
  if (age >= 18 || hasParent)  {
      if (hasTicket) {
        alert("Come on in!")
      } else if (money >= 10) {
        money = money - 10;
        hasTicket = true;
        alert("Come on in!")
      }
  } else {
    alert("Sorry, you can't come in.")
  }
}

// Refactor #1 below



//////////////////////////////
// ANTIPATTERNS - Example 2 //
//////////////////////////////

var locations = [
  ["Home", "This is where I live", -39.0182, 128.0892],
  ["School", "This is where I learn", -39.6383, 128.1652]
]

///... elsewhere in code

locations.forEach(function(place,i){
  var marker = buildMarker(place[2], place[3])
  marker.title = place[0];
  addMarker(marker)
})

// Refactor #2 below
