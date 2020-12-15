class ApplicationController < ActionController::Base
    before_action :set_locale
    before_action :max_guests
    before_action :waiting_reservations

    before_action :redirect_subdomain

    def redirect_subdomain
        if request.host == 'www.ldvhomes.com'
          redirect_to 'https://ldvhomes.com' + request.fullpath, status: 301
        end
    end
 
    def set_locale
        I18n.locale = params[:locale].presence || I18n.default_locale
    end

    def current_admin
        @admin ||= Admin.find_by_id(session[:admin_id])
    end
    helper_method :current_admin
    
    def admin_logged_in?
        current_admin.is_a? Admin
    end
    
    def authenticate_admin!
        redirect_to backend_login_path unless admin_logged_in?
    end

    def default_url_options
        if I18n.locale == :en
            return { locale: '.' }
        end
        { locale: I18n.locale }
    end

    def max_guests
        @max_guests = Apartment.maximum("capacity")
    end

    def featured_apartments?
        @featured_apartments = Apartment.where(in_evidence: true)
    end

    def load_areas
        #@areas = Area.all.order('updated_at DESC')
        @areas = Area.joins(:apartments).where('apartments.published': true).group('areas.id').having('count(area_id) > 0')
    end

    def waiting_reservations
        @waiting_reservations = Reservation.where(status: 'waiting').where('date_start >= ?', Time.now).count
    end

    def load_apartments
        @apartments = Apartment.where(published: true)
    end

    rescue_from ActionController::RoutingError, with: :page_not_found

    def page_not_found
        @areas = Area.all.order('updated_at DESC')
        @apartments = Apartment.where(published: true)
        render '404.html', status: 404
    end
end
