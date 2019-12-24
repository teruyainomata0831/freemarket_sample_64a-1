$(document).on('turbolinks:load', function() { 

  jQuery(function($){
    $('.notice').click(function(){
        $('.active-test').removeClass('active-test');
        $(this).addClass('active-test');
        $('.test').removeClass('test');
        // クリックしたタブからインデックス番号を取得
        var index = $(this).index();
        // クリックしたタブと同じインデックス番号をもつコンテンツを表示
        $('.tab-content').eq(index).addClass('test');
    });

    $('.transaction').click(function(){
        $('.active').removeClass('active');
        $(this).addClass('active');
        $('.show').removeClass('show');
        // クリックしたタブからインデックス番号を取得
        var index = $(this).index();
        // クリックしたタブと同じインデックス番号をもつコンテンツを表示
        $('.tabs-content').eq(index).addClass('show');
    });
  });
})
