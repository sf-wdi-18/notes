$(function () {
  // select the rave element
  var $rave = $("#rave");

  //then I want to change it to blue
  $rave.css({
    "width": "100px",
    "height": "100px",
    "backgroundColor": "rgb(0,0,255)"
  });

  // my initial color state
  var raveRGB = {
                  "red": 0,
                  "green": 0,
                  "blue": 255
                };

    var setColor = function (color, value) {
      // color is "red", "green", or "blue"
      raveRGB[color] = value;

      var colorStr = "rgb(" +
                          raveRGB.red + ", " +
                          raveRGB.green + ", " +
                          raveRGB.blue + ")";

      $rave.css("backgroundColor", colorStr);
    };
  


    var $colorDetails = $("#colorDetails");
    //var $myNum = 1; // bad, not a jquery obj
    
    $colorDetails.on("change", function (event) {
      console.log(event.target.id);
      console.log(event.target.value);

      // use the above info to update the 
      //  $rave element
      var color = event.target.id;
      var value = event.target.value;

      setColor(color, value)

    });



});











      
















