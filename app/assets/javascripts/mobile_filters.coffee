document.addEventListener 'turbolinks:load', () ->
    $('#map-and-filters-mobile .filters-icon').on 'click', () ->
        searchForm = $('.form-apartment-desktop-container .search-form-container').detach()
        $('.mobile-modal .form-apartment-mobile-container').append(searchForm)
        $('.mobile-modal .search-form').show()
        $('.mobile-modal .map-container').hide()
        $('.mobile-modal').toggleClass('opened')

    $('#map-and-filters-mobile .btn-primary').on 'click', () ->
        bookingForm = $('#desktop-booking-container #booking-form-container').detach()
        $('.mobile-modal .booking-form-container').append(bookingForm)
        $('.mobile-modal').show()
        $('.mobile-modal').toggleClass('opened')

    $('#map-and-filters-mobile .map-icon').on 'click', () ->
        $('.mobile-modal .search-form').hide()
        $('.mobile-modal .map-container').show()
        mapDetached = $('#apartments-map #map').detach()
        $('.mobile-modal .map-container').append(mapDetached)
        $('.mobile-modal').toggleClass('opened')

    $('.mobile-modal .close-modal').on 'click', () ->
        mapDetached = $('.mobile-modal #map').detach()
        bookingForm = $('.mobile-modal #booking-form-container').detach()
        searchForm = $('.mobile-modal .form-apartment-mobile-container .search-form-container').detach()
        $('.form-apartment-desktop-container').append(searchForm)
        $('#apartments-map').append(mapDetached)
        $('#desktop-booking-container').append(bookingForm)
        $('.mobile-modal').removeClass('opened')

    $(window).on 'resize', () ->
        if $(this).width <= 1200
            bookingForm = $('#desktop-booking-container #booking-form-container').detach()
            $('.mobile-modal .booking-form-container').append(bookingForm)
        else
            $('.mobile-modal').removeClass('opened')
            bookingForm = $('.mobile-modal #booking-form-container').detach()
            $('#desktop-booking-container').append(bookingForm)
            