class ReservationsController < ApplicationController
    def create
        @success = false
        @reservation = Reservation.new(reservation_params)
        
        if @reservation.save
            flash.notice = t('booking.success')
            redirect_to apartments_path 
        end

        respond_to do |format|
            format.js
        end
    end

    def reservation_params
        params.permit(:name, :email, :phone_number, :more_info, :date_start, :date_end, :guests, :apartment_id)
    end
end
