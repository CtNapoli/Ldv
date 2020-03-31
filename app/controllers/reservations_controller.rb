class ReservationsController < ApplicationController
    def create
        @success = false
        @reservation = Reservation.new(reservation_params)
        
        if @reservation.save
            flash.notice = t('booking.success', apartment: @reservation.apartment.name, from: l(@reservation.date_start, format: '%d %B %Y'), to: l(@reservation.date_end, format: '%d %B %Y'))
            BookingRequestMailer.with(booking_request: @reservation).booking_request_sent.deliver_now
            redirect_to apartment_path(@reservation.apartment) 
        end

        respond_to do |format|
            format.js
        end
    end

    def reservation_params
        params.permit(:name, :email, :phone_number, :more_info, :date_start, :date_end, :guests, :apartment_id, :total_price)
    end
end
