function reverse(word) {
    var wordArray = word.split();
    wordArray.reverse();
    debugger;
    var reversedWord = wordArray.join(); //join includes "," but whY!?
    return reversedWord;
}


console.log(reverse("yabadabadoo!"));
