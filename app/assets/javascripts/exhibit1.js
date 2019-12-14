jQuery(function($){
  $('.active-test').click(function(){
      $('.active').removeClass('active');
      $(this).addClass('active');
      $('.show-test-jquery').removeClass('show-test-jquery');
      // クリックしたタブからインデックス番号を取得
      const index = $(this).index();
      // クリックしたタブと同じインデックス番号をもつコンテンツを表示
      $(' .tab').eq(index).addClass('show-test-jquery');
  });
});