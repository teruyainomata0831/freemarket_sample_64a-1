jQuery(function($){
  $('.active').click(function(){
      $('.active.active').removeClass('active.active');
      $(this).addClass('active.active');
      $('.active').removeClass('active');
      // クリックしたタブからインデックス番号を取得
      const index = $(this).index();
      // クリックしたタブと同じインデックス番号をもつコンテンツを表示
      $('.tab-content').eq(index).addClass('active');
  });
});
