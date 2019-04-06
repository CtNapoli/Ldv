# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener 'turbolinks:load', () ->
    if $('#destinations .swiper-container').length
      areaSwiper = new Swiper('#destinations .swiper-container', {
        slidesPerView: 4,
        spaceBetween: 20
        breakpoints: {
          1200: {
            slidesPerView: 'auto'
          }
        }
      });

