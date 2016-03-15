$('document').ready(function(){
   $('.search-box input')
    .focus(function(){
      $('.search-box').addClass('search-box-focus');
    })
    .blur(function(){
      $('.search-box').removeClass('search-box-focus');
    });
});



