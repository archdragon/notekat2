$(document).ready(function(){
  $(".note .btn-edit").click(function(){
    $("#"+$(this).data("id")+" .hidden-form").slideToggle();
  });
});
