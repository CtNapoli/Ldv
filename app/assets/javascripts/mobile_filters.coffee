document.addEventListener 'turbolinks:load', () ->
    $('#map-and-filters-mobile .filters-icon').on 'click', () ->
        $('.mobile-modal .search-form').show()
        $('.mobile-modal .map-container').hide()
        $('.mobile-modal').toggleClass('opened')

    $('#map-and-filters-mobile .map-icon').on 'click', () ->
        $('.mobile-modal .search-form').hide()
        $('.mobile-modal .map-container').show()
        mapDetached = $('#apartments-map #map').detach()
        $('.mobile-modal .map-container').append(mapDetached)
        $('.mobile-modal').toggleClass('opened')

    $('.mobile-modal .close-modal').on 'click', () ->
        mapDetached = $('.mobile-modal #map').detach()
        $('#apartments-map').append(mapDetached)
        $('.mobile-modal').removeClass('opened')

    $('.mobile-modal .btn').on 'click', () ->
        $('.mobile-modal').removeClass('opened')