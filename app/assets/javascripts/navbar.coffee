document.addEventListener 'turbolinks:load', () ->
    $('header #toggle-menu').on 'click', () ->
        $('header').toggleClass('mobile-opened')
        
    $('#main-menu-mobile .nav-item .nav-link').on 'click', () ->
        $('header').removeClass('mobile-opened')