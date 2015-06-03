// In our old javascript way
var pTimes = function(statement,num) {
  for (var i = 0; i < num; i++) {
    console.log(statement);
  }
}
// In a more ruby like way
var pTimes2 = function(statement,num) {
  var i = 0;
  while(i < num) {
    console.log(statement);
    i += 1;
  }
}

// Solution to Exercise 2 in javascript
var letterCount = function(str) {
  var ans = {};
  for (var i = 0; i<str.length; i++) {
    if (typeof ans[str[i]] === 'undefined') {
      ans[str[i]] = 1;
    } else {
      ans[str[i]] += 1;
    }
  }
  return ans;
};

// Solution to Exercise 2 in javascript in a ruby style
var letterCount2 = function(str) {
  var ans = {};
  var i = 0;
  while(i < str.length) {
    if (typeof ans[str[i]] === 'undefined') {
      ans[str[i]] = 1;
    } else {
      ans[str[i]] += 1;
    }
    i++;
  }
  return ans;
};

console.log(letterCount2('hello'));


// Doing exercise 3 in javascript is really hard. I wouldn't reccomend doing it

var printContacts = function(contacts) {
  for (var i in contacts) {
    console.log(i + ' => ' + contacts[i]);
  }
}

printContacts({'michael': '555-555-5555', 'delmer': '666-666-6666'});