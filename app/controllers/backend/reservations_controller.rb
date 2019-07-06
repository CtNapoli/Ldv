class Backend::ReservationsController < BackendController
    before_action :authenticate_admin!
    before_action :load_reservation, only: [:reject, :accept]

    def index
        @reservation_status = params[:reservation_status]
        @apartment_name = params[:apartment_name]

        @reservations = Reservation.order('created_at DESC').page params[:page]

        if @reservation_status.present? && @apartment_name.present?
            @reservations = @reservations.joins(apartment: :translations).where('apartment_translations.name ILIKE ?', "%#{@apartment_name}%").where(status: @reservation_status)
        end

        if @reservation_status.blank? && @apartment_name.present?
            @reservations = @reservations.joins(apartment: :translations).where('apartment_translations.name ILIKE ?', "%#{@apartment_name}%")
        end
        
        if @apartment_name.blank? && @reservation_status.present?
            @reservations = @reservations.where(status: @reservation_status)
        end
        
    end

    def reject
        if @reservation.reject!
            flash.alert = t('booking.reservation_reject', apartment: @reservation.apartment.name, from: l(@reservation.date_start, format: '%d %B %Y'), to: l(@reservation.date_end, format: '%d %B %Y'))

            redirect_to backend_reservations_path
        end
    end

    def accept
        if @reservation.accept!
            flash.notice = t('booking.reservation_success', apartment: @reservation.apartment.name, from: l(@reservation.date_start, format: '%d %B %Y'), to: l(@reservation.date_end, format: '%d %B %Y'))
            redirect_to backend_reservations_path
        end
    end

    def load_reservation
        @reservation = Reservation.find_by_id(params[:reservation_id])
    end
end
