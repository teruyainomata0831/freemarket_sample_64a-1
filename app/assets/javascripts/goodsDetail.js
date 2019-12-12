$(function(){
  
  $('.item-dots img').hover(function(){
    let index = $(".item-dots img").index(this);
      $('.is-active').removeClass('is-active');
      $('.item-dot').eq(index).addClass('is-active');
  });
  $('.item-dots img').hover(function(){
    let src = $(this).attr('src');
      $('.main-img').attr('src', src);
  })
})