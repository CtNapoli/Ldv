document.addEventListener 'turbolinks:load', () ->
    iconDelete = $('#main-image').data('icon-delete');
    $('#backend #main-image input[type=file]').on 'change', () ->
        $('#backend #main-image .all-previews').append('<div id="image-0" class="box-preview" style="background-image: url(' + URL.createObjectURL($(this).prop('files')[0]) + ')"></div>')

        boxImage = $('#backend #main-image .all-previews .box-preview#image-0')

        boxImage.append('<a href="" class="round"><img src="' + iconDelete + '" alt="Close"/></a>').on 'click', 'a', (e) ->
            e.preventDefault()
            $('#backend #main-image input[type=file]').val('')
            $('#backend #main-image .all-previews .box-preview#image-0').remove()

    $('#backend #images input[type=file]').on 'change', () ->
        files = $(this).prop('files')

        $.each(files, (key, value) ->
            $('#backend #images .all-previews').append('<div id="image-' + key + '" class="box-preview" style="background-image: url(' + URL.createObjectURL(files[key]) + ')"></div>')

            boxImage = $('#backend #images .all-previews .box-preview#image-' + key)

            boxImage.append('<a href="" class="round"><img src="' + iconDelete + '" alt="Close"/></a>').on 'click', 'a', (e) ->
                e.preventDefault()
                $('#backend #images input[type=file]').val('')
                $('#backend #images .all-previews .box-preview#image-' + key).remove()
                
        )

    #PARAGRAPHS VUE APP
    if $('#paragraphs').length
        allParagraphs = JSON.parse($('#paragraphs input[type=hidden]').val())

        paragraphsApp = new Vue({
            el: '#paragraphs',
            data: {
                paragraphs: allParagraphs || []
            },
            methods: {
                addParagraph: () ->
                    this.paragraphs.push(
                        {'title': '','text': ''}
                    )
                    this.updateParagraphs()

                removeParagraph: (index) ->
                    this.paragraphs.splice(index,1)
                    this.updateParagraphs()
                    


                updateParagraphs: () ->
                    $('#paragraphs input[type=hidden]').val(JSON.stringify(this.paragraphs))
            }
        })

    
