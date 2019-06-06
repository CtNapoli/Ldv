document.addEventListener 'turbolinks:load', () ->
    if $('#apartments-form').length
        apartmentsForm = new Vue({
            el: '#apartments-form',
            data: {
                where: $('#area_dropdown input[type=hidden]').val() || null,
                guests: $('#guests_dropdown input[type=hidden]').val() || null,
                submittable: false
            },
            methods: {
                activeSubmit: () ->
                    this.submittable = true if this.where != null && this.guests != null
            }
        })

    setValueDropdown = (value, label, id) ->
        $('#' + id + ' .dropdown-button span').text(label)
        $('#' + id + ' input[type=hidden]').val(value)

        apartmentsForm.where = value if id == 'area_dropdown'
        apartmentsForm.guests = value if id == 'guests_dropdown'
        apartmentsForm.activeSubmit()


    $('.dropdown .dropdown-menu .dropdown-item').on 'click', () ->
        setValueDropdown($(this).data('value'), $(this).text(), $(this).parent().parent().attr('id'))


    

    