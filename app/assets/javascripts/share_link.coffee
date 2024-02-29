document.addEventListener 'turbolinks:load', () ->
    # Funzione per gestire il clic sul pulsante
    $('#copy-link-button').click ->
        copyToClipboard(window.location.href)

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
        alert('Link copiato con successo!')