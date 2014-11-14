$(function() {
    $(window).resize(function() {
        $('#left-menu').height($(window).height() - $('#left-menu').offset().top);
    });
    $(window).resize();
});