$(document).ready(function(){
  $(".note .btn-edit").click(function(){
    $("#"+$(this).data("id")+" .hidden-form").slideToggle();
  });

  $(".link-block").click(function(){
    var addr = $(this).find("a").attr("href");
    window.location.href = addr;
  });
});
