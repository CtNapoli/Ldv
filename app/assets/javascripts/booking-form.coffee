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
                range: {
                    start: new Date(),
                    end: new Date(),
                },
                masks: {
                    input: 'YYYY-MM-DD',
                },
                prices: '',
                defaultPrice: 0,
                priceCleaningService: 0,
                submittable: false,
                priceForNights: 0,
                total: 0,
                nights: 0,
                servicePerc: 0.10,
                servicePrice: 0,
            },
            methods: {
                calculatePrices: () ->
                    this.nights = 0
                    this.priceForNights = 0
                    
                    progressDate = new Date(this.range.start)
                    endDateCopy = new Date(this.range.end)

                    #if this.prices.length > 0
                    while progressDate < endDateCopy
                        i = 0
                        while i < this.prices.length 
                            start = new moment(this.prices[i].start, "YYYY-MM-DD").toDate()
                            end = new moment(this.prices[i].end, "YYYY-MM-DD").toDate()

                            if progressDate >= start && progressDate <= end
                                this.priceForNights += parseFloat(this.prices[i].price)
                                founded = true

                            i++

                        if !founded
                            this.priceForNights += parseFloat(this.defaultPrice)

                        this.nights += 1
                        newDate = progressDate.setDate(progressDate.getDate() + 1)
                        progressDate = new Date(newDate)

                    ### else 
                        while progressDate < endDateCopy
                            i = 0
                            while i < this.prices.length 
                                start = new moment(this.prices[i].start, "YYYY-MM-DD").toDate()
                                end = new moment(this.prices[i].end, "YYYY-MM-DD").toDate()

                                if progressDate >= start && progressDate <= end
                                    this.priceForNights += parseFloat(this.prices[i].price)
                                    founded = true

                                i++

                            if !founded
                                this.priceForNights += parseFloat(this.defaultPrice)

                            this.nights += 1
                            newDate = progressDate.setDate(progressDate.getDate() + 1)
                            progressDate = new Date(newDate) ###

                    this.servicePrice = parseFloat((this.priceForNights*this.servicePerc).toFixed(2))
                    this.total = this.priceForNights + this.servicePrice + this.priceCleaningService
                    

                    $('#start').val(this.range.start)
                    $('#end').val(this.range.end)
                    $('#total_price').val(this.total)



                enabled: () ->
                    this.submittable = this.guests != null && this.range.start != null && this.range.end != null 

            }
            watch: {
                range: () ->
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
                this.defaultPrice = parseFloat($('#apartment-properties').data('defaultprice'))
                this.priceCleaningService = parseFloat(parseFloat($('#apartment-properties').data('pricecleaningservice')).toFixed(2))
                this.calculatePrices()
        })

        setValueDropdown = (value, label, id, app) ->
            $('#' + id + ' .dropdown-button span').text(label)
            $('#' + id + ' input[type=hidden]').val(value)

            app.guests = value if id == 'guests_dropdown'

        $('.dropdown .dropdown-menu .dropdown-item').on 'click', () ->
            setValueDropdown($(this).data('value'), $(this).text(), $(this).parent().parent().attr('id'), bookingForm)

        $('.from_to input').on 'click', () ->
            $('.from_to input').attr('readonly', true)