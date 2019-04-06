document.addEventListener 'turbolinks:load', () ->
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
                        {'title': 'Titolo qui...','text': 'Testo qui...'}
                    )
                    this.updateParagraphs()

                removeParagraph: (index) ->
                    this.paragraphs.splice(index,1)
                    this.updateParagraphs()


                updateParagraphs: () ->
                    $('#paragraphs input[type=hidden]').val(JSON.stringify(this.paragraphs))
            }
        })
        
