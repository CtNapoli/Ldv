document.addEventListener 'turbolinks:load', () ->
    if $('#area .swiper-container').length
        areaGallerySwiper = new Swiper('#area .swiper-container', {
            autoHeight: true,
            loop: true,
            navigation: {
                nextEl: '.navigation.next',
                prevEl: '.navigation.prev',
            },
        });
