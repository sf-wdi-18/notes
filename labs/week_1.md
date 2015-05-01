#Week 1 Project - Tic Tac Toe

**Objective:** Build a tic taco game in HTML and pure javascript.

This week we have been learning about writing functions, working with loops, and writing conditionals. We also learned about how parts of HTML work and function.

Today we will be making a Tic Tac Toe game using all of this.

## Minimum Requirements
* A user should be able to click on different squares to make a move.
* Every click will alternate between marking an `X` and `O`
* Upon marking of an individual cell, use javascript to add a class to each cell to display separate colors.
* A cell should not be able able to replayed once marked.
* Add a reset button that will clear the contents of the board.

##How to get started
1. Construct a `index.html` to be your starting point on this project. Add your necessary html tags, including `script` and `link` tags to link to your javascript and css respecively.
2. Before you even start working with javascript, construct the gameboard. The gameboard page should include the 3x3 grid, and at minimum a reset button. Using `id` and `class` on clickable elements will help you wire this up in javascript afterwards.
3. Javascript portion will be next
	* Locate the element first to use it within your app. Think about using `document.getElementById` or `document.getElementsByClassName` to locate your target elements. Try this in your console to make sure your selection works.
	* After finding the elements, start writing logic to use the `onclick` function against those elements.
	* You will also need a variable to keep track of moves. As this will be used to indicate whether or not to draw an `X` or an `O`

##Bonus
* Display a message to indicate which turn is about to be played.
* After the necessary moves have been played, stop game and alert the winner if one player ends up winning with three in a row.
	* Hint: Determine a set of winning combinations. Check those combinations on the board contents after every move.



## Resources

* [DOM NOTES](https://github.com/sf-wdi-15/notes/tree/master/week_01_programming_fundamentals_with_the_web/day_4_dom/dusk_dom)
* [DOM Practice](https://github.com/sf-wdi-15/js_dom)
* [Calculator Practice](https://github.com/sf-wdi-15/calculatorLab)