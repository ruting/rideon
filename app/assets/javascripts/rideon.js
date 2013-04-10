(function() {

  // Setup drop down menu
  $('.dropdown-toggle').dropdown();
 
  // Fix input element click problem
  $('.dropdown input, .dropdown label').click(function(e) {
    e.stopPropagation();
  });

$('#nav-wrapper').height($("#nav").height()*1.5);
$('#nav').affix({
    offset: $('#nav').position()
});

<!-- Resize the logo of the navbar-->
$(window).scroll(function() {
    var scrolled = $(window).scrollTop();
    if (scrolled > 20) {
        $("#logo").css({'height': '68px'});
    } else {
        $("#logo").css({'height' : '108px'});
    }
})

}).call(this);