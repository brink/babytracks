$(document).ready(function() {
  jQuery(".actions form").submit(function(event) {
    event.preventDefault();
    $.ajax({
      url: "/events",
      type: "POST",
      data: jQuery(event.target).serialize(),
      context: document.body,
      success: function(){
       location.reload(); 
      }
    });

  });
});
