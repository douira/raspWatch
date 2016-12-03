//get message id
var msgId = $("#msgId").text();

//comment textarea with #comment id
$("#comment").on("change beforeunload", function() {
  //send post with value and message id
  $.post(
    "editComment.php",
    {id: msgId, data: $(this).val()},

    //check response for error
    function (response) {
      if (response !== "OK") {
        console.log("POST request: '" + response + "'");
      }
    }
  );
});
