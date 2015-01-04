$(document).ready(function(){
  $("#calendar .version").popover({
    title: function() { return $(this).find(".popover-data .title").text() },
    html: true,
    content: function() { return $(this).find(".popover-data .content").html() },
    container: "body"
  });

  $('.version').on('click', function (e) {
    $('.version').not(this).popover('hide');
  });
});