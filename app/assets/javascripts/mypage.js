jQuery(function($){
  $('.notice').click(function(){
      $('.active').removeClass('active');
      $(this).addClass('active');
      $('.show').removeClass('show');
      // クリックしたタブからインデックス番号を取得
      const index = $(this).index();
      // クリックしたタブと同じインデックス番号をもつコンテンツを表示
      $('.tab-content').eq(index).addClass('show');
  });

  $('.transaction').click(function(){
      $('.active').removeClass('active');
      $(this).addClass('active');
      $('.show').removeClass('show');
      // クリックしたタブからインデックス番号を取得
      const index = $(this).index();
      // クリックしたタブと同じインデックス番号をもつコンテンツを表示
      $('.tabs-content').eq(index).addClass('show');
  });
});