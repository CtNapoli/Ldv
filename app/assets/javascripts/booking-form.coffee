document.addEventListener 'turbolinks:load', () ->
    if $('#booking-form').length
        bookingForm = new Vue({
            el: '#booking-form',
            data: {
                guests: $('#guests_dropdown input[type=hidden]').val(),
                disabledDates: '',
                selectedDate: {
                    start: new Date()
                    end: new Date()
                },
                prices: '',
                defaultPrice: 0,
                priceCleaningService: 0,
                submittable: false,
                priceForNights: 0,
                total: 0,
                nights: 0,
                servicePerc: 10,
                servicePrice: 0,
            },
            methods: {
                calculatePrices: () ->
                    this.nights = 0
                    this.priceForNights = 0
                    start = new Date(this.selectedDate.start)
                    end = new Date(this.selectedDate.end)

                    while start < end
                        console.log(start)
                        if this.prices.length > 0
                            for value in this.prices
                                if start >= new Date(value.start) && start < new Date(value.end)
                                    this.priceForNights += parseFloat(value.price)
                                    break

                                else
                                    this.priceForNights += parseFloat(this.defaultPrice)
                                    break

                        this.nights += 1
                        newDate = start.setDate(start.getDate() + 1)
                        start = new Date(newDate)


                    this.servicePrice = this.priceForNights/this.servicePerc
                    this.total = this.priceForNights + this.servicePrice + this.priceCleaningService

                    $('#start').val(this.selectedDate.start)
                    $('#end').val(this.selectedDate.end)
                    $('#total_price').val(this.total)



                enabled: () ->
                    this.submittable = this.guests != null && this.selectedDate.start != null && this.selectedDate.end != null 

            }
            watch: {
                selectedDate: () ->
                    this.calculatePrices()
                    this.enabled()

                guests: () ->
                    this.enabled()
            },
            computed: {
                nightsString: () ->
                    return 'x' + this.nights + ' notti' if this.nights > 1 && window.locale == 'it'
                    return 'x' + this.nights + ' notte' if this.nights == 1 && window.locale == 'it'
                    return 'x' + this.nights + ' nights' if this.nights > 1 && window.locale == 'en'
                    return 'x' + this.nights + ' night' if this.nights == 1 && window.locale == 'en'
            },
            filters: {
                formatDate: (value) ->
                    return moment(String(value)).format('DD/MM/YYYY') if (value)
            },
            mounted: () ->
                this.disabledDates = $('#apartment-properties').data('dates')
                this.prices = $('#apartment-properties').data('prices')
                this.defaultPrice = $('#apartment-properties').data('defaultprice')
                this.priceCleaningService = parseFloat($('#apartment-properties').data('pricecleaningservice'))
                this.calculatePrices()
        })

        setValueDropdown = (value, label, id, app) ->
            $('#' + id + ' .dropdown-button span').text(label)
            $('#' + id + ' input[type=hidden]').val(value)

            app.guests = value if id == 'guests_dropdown'

        $('.dropdown .dropdown-menu .dropdown-item').on 'click', () ->
            setValueDropdown($(this).data('value'), $(this).text(), $(this).parent().parent().attr('id'), bookingForm)
