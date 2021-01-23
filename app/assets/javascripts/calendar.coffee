document.addEventListener 'turbolinks:load', () ->
    $(document).on 'click', '.from_to', ->
        $('.vc-container').css('display', 'flex')