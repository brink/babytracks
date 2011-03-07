// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
  jQuery("#x_feed_link").click(function(event) {
    event.preventDefault();
    alert('foo');
    $.ajax({
      url: "/events",
      type: "POST",
      data: ({'event[event_type]': 'feeding'}),
      context: document.body,
      success: function(){
       location.reload(); 
      }
    });

  });
  jQuery("#x_diaper_link").click(function(event) {
    event.preventDefault();
    alert('foo');
    $.ajax({
      url: "/events",
      type: "POST",
      data: ({'event[event_type]': 'diaper'}),
      context: document.body,
      success: function(){
       location.reload(); 
      }
    });

  });

});
