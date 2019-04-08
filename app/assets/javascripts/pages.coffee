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

    if $('#featured-apartments').length
      featuredApartmentsSwiper = new Swiper('#featured-apartments .swiper-container', {
        slidesPerView: 3,
        spaceBetween: 15
        navigation: {
          nextEl: '#featured-apartments .nav.next',
          prevEl: '#featured-apartments .nav.prev',
        },
        breakpoints: {
          1200: {
            slidesPerView: 'auto'
          }
        }
      });

