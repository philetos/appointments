$(function() {
  $("#generate-key-btn").click(function(event) {
    event.preventDefault();
    $.ajax({
      url: "/access_keys.json",
      type: "POST",
      contentType: "application/json; charset=utf-8",
      success: function(access_key) {
        console.log(access_key);
        if ($(".bottom-container").css('display') === 'none') {
          $("#access-key").html(access_key.token);
          $(".bottom-container").fadeIn();
        } else {
          $(".bottom-container").fadeOut(function() {
            $("#access-key").html(access_key.token);
            $(".bottom-container").fadeIn();
          });
        }
      }
    });
  });
});