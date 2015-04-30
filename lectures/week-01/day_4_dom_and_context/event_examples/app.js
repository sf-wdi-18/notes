window.addEventListener("load", function (){
    // your work here.

    var randVal = function (){ 
      var randNum = Math.floor(Math.random()*256);;
      return randNum;
    };

    var getColor = function () {
      return "rgb("+ randVal() +"," + randVal() + "," + randVal() + ")";
    };

    var greetCon = document.querySelector("#greetCon");

    var deg = 0;

    greetCon.addEventListener("click", function (event) {
      setInterval(function () {
        deg += 10;

        greetCon.style.transform = "rotateZ("+deg +"deg)";
        greetCon.style.padding = randVal() + "px";
        greetCon.style.backgroundColor = getColor();
      }, 200)
    });
});