document.addEventListener 'turbolinks:load', () ->
    if $('#apartment .swiper-container').length
        apartmentGallerySwiper = new Swiper('#apartment .swiper-container', {
            autoHeight: true,
            loop: true,
            navigation: {
                nextEl: '.navigation.next',
                prevEl: '.navigation.prev',
            },
        });
