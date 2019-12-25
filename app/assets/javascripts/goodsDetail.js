$(document).on('turbolinks:load', function() { 
  $(function(){

    $('.item-dots img').hover(function(){
      var num = $(".item-dots img").index(this);
        $('.is-active').removeClass('is-active');
        $('.item-dot').eq(num).addClass('is-active');
    });
    $('.item-dots img').hover(function(){
      var src = $(this).attr('src');
        $('.main-img').attr('src', src);
    })
  })
})
