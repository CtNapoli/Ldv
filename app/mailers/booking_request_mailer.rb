class BookingRequestMailer < ApplicationMailer
    default from: "ldvwebsite1@gmail.com"

    def booking_request_sent
        @booking_request = params[:booking_request]
        @to = ['info@ldvhomes.com', 'vittorioacampora@ldvhomes.com', 'marcoderosa@ldvhomes.com']
        @subject = 'Richiesta prenotazione'
        mail(to: @to, subject: @subject)
    end
end
