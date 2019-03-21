class ApplicationController < ActionController::Base
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
end
