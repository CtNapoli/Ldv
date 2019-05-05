document.addEventListener 'turbolinks:load', () ->
    $('header #toggle-menu').on 'click', () ->
        $('header').toggleClass('mobile-opened')