# Preview all emails at http://localhost:3000/rails/mailers/booking_request_mailer
class BookingRequestMailerPreview < ActionMailer::Preview
    def booking_request_sent
        BookingRequestMailer.with(booking_request: Reservation.first).booking_request_sent
    end
end
