class ApplicationController < ActionController::Base
    before_action :set_locale
    before_action :max_guests
 
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
        if I18n.locale == :it
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
        @areas = Area.all
    end

    def load_apartments
        @apartments = Apartment.all
    end
end
