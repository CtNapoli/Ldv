### document.addEventListener 'turbolinks:load', () ->
    # Funzione per gestire il clic sul pulsante
    $('#copy-link-button').click ->
        copyToClipboard(window.location.href)
        $('#sharing').css('display', 'block')

    $('#send-email-button').click ->
        email = $('#email').val()
        link = $('#link').val()

        $.ajax
            type: 'POST'
            url: '/apartments_controller/send_email'
            data: { email: email, link: link }
            success: (response) ->
                if response.success
                    alert('Email inviata con successo!')
                else
                    alert('Si è verificato un errore durante l\'invio dell\'email.')

    # Funzione per copiare il testo negli appunti
    copyToClipboard = (text) ->
        # Creazione di un elemento textarea temporaneo
        tempInput = $('<textarea>')
        $('body').append(tempInput)

        # Impostazione del testo da copiare nell'elemento textarea
        tempInput.val(text).select()

        # Copia del testo negli appunti
        document.execCommand('copy')

        # Rimozione dell'elemento textarea temporaneo
        tempInput.remove()

        # Notifica utente di copia avvenuta
        alert('Link copiato con successo!') ###