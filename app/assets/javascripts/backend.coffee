document.addEventListener 'turbolinks:load', () ->
    $('#backend #main-image input[type=file]').on 'change', () ->
        $('#backend #main-image .all-previews').append('<div id="image-0" class="box-preview" style="background-image: url(' + URL.createObjectURL($(this).prop('files')[0]) + ')"></div>')

        boxImage = $('#backend #main-image .all-previews .box-preview#image-0')

        boxImage.append('<a href="#">delete</a>').on 'click', 'a', (e) ->
            e.preventDefault()
            $('#backend #main-image input[type=file]').val('')
            $('#backend #main-image .all-previews .box-preview#image-0').remove()

    $('#backend #images input[type=file]').on 'change', () ->
        files = $(this).prop('files')

        $.each(files, (key, value) ->
            console.log files
            $('#backend #images .all-previews').append('<div id="image-' + key + '" class="box-preview" style="background-image: url(' + URL.createObjectURL(files[key]) + ')"></div>')

            boxImage = $('#backend #images .all-previews .box-preview#image-' + key)
            console.log boxImage

            boxImage.append('<a href="#">delete</a>').on 'click', 'a', (e) ->
                e.preventDefault()
                $('#backend #images input[type=file]').val('')
                $('#backend #images .all-previews .box-preview#image-' + key).remove()
        )

    
