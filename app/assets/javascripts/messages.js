$(function(){
  $("#messages-inner").animate({ scrollTop: $(".message-wrapper:last").position().top}, 1000);
  if (window.webkitNotifications.checkPermission() == 0) {
    $("#notify_btn").text("Notification Allowed");
  } else {
    $("#notify_btn").text("Set Notification");
  };

  $("input:submit").click(function(){
    $(this).closest("input:text").val("");
  });

  $("form#new_message").on("ajax:beforeSend.rails", function(e){
    if (e.target == this){
      $("input:text").val("");
    }
  });

  setInterval(function(){
    $.ajax({
      type: "GET",
      url: "/messages",
      data: "",
      dataType: "script"
    })
  }, 5000);

  document.querySelector('#notify_btn').addEventListener('click', function() {
    if (window.webkitNotifications.checkPermission() == 0) {
      $("#notify_btn").text("Notification Allowed");
    } else {
      window.webkitNotifications.requestPermission();
    }
  }, false);

  $("#messages-inner").on("DOMNodeInserted", ".message-wrapper", function(e){
    $("#messages-inner").animate({ scrollTop: ($(e.currentTarget).position().top - $(".message-wrapper:first").position().top)}, 1000);
  })
})
