class BookingRequestMailer < ApplicationMailer
    default from: "info@ldvhomes.com"

    def booking_request_sent
        @booking_request = params[:booking_request]
        @to = 'criscialfonso92@gmail.com'
        @subject = 'Richiesta prenotazione'
        mail(to: @to, subject: @subject)
    end
end
