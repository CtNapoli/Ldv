document.addEventListener 'turbolinks:load', () ->
    $('.social-banner .default').on 'click', (e) ->
        e.preventDefault()
        $('.social-banner').toggleClass('opened')