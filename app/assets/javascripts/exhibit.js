jQuery(function($){
  $('.listing-tabs-exhibit li').click(function(){
      $('.active').removeClass('active');
      $(this).addClass('active');
      $('.show').removeClass('show');
      // クリックしたタブからインデックス番号を取得
      var index = $(this).index();
      // クリックしたタブと同じインデックス番号をもつコンテンツを表示
      $('.mypage-item-not-found').eq(index).addClass('show');
  });
});