$(function() {
  $('#back a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});

// Swiperのオプションを定数化
const opt = {
  loop: true, 
   autoplay: {
    delay: 5000,
  },
}

// Swiperを実行
$(document).on('turbolinks:load', function() {
    let swiper = new Swiper('.swiper',opt);
});