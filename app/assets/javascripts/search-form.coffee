document.addEventListener 'turbolinks:load', () ->
    if $('#apartments-form').length
        apartmentsForm = new Vue({
            el: '#apartments-form',
            data: {
                where: $('#area_dropdown input[type=hidden]').val() || null,
                guests: $('#guests_dropdown input[type=hidden]').val() || null,
                disabledDates: '',
                selectedDate: {
                    start: new Date()
                    end: new Date()
                },
                range: {
                    start: new Date(),
                    end: new Date(),
                },
                masks: {
                    input: 'YYYY-MM-DD',
                },
                submittable: false
            },
            methods: {
                enabled: () ->
                    this.submittable = this.guests != null && this.range.start != null && this.range.end != null && this.where != null
            },
            watch: {
                selectedDate: () ->
                    this.enabled()

                guests: () ->
                    this.enabled()

                where: () ->
                    this.enabled()
                   
            },
            filters: {
                formatDate: (value) ->
                    return moment(String(value)).format('DD/MM/YYYY') if (value)
            }
        })

     setValueDropdown = (value, label, id, app) ->
        $('#' + id + ' .dropdown-button span').text(label)
        $('#' + id + ' input[type=hidden]').val(value)

        app.where = value if id == 'area_dropdown'
        app.guests = value if id == 'guests_dropdown'


    $('.dropdown .dropdown-menu .dropdown-item').on 'click', () ->
        setValueDropdown($(this).data('value'), $(this).text(), $(this).parent().parent().attr('id'), apartmentsForm)


    

    