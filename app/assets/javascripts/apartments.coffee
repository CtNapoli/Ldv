# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener 'turbolinks:load', () ->
    if $('#apartment .swiper-container').length
        apartmentGallerySwiper = new Swiper('#apartment .swiper-container', {
            navigation: {
                nextEl: '.navigation.next',
                prevEl: '.navigation.prev',
            },
        });
