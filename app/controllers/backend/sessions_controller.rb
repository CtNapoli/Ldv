class Backend::SessionsController < ApplicationController
    layout 'admin'

    def new
        @admin = Admin.new
    end
    
    def create
        admin = Admin.find_by(username: params[:username])
        if admin && admin.authenticate(params[:password])
            session[:admin_id] = admin.id
            redirect_to backend_all_apartments_path
        else
            flash.now.alert = 'Nome utente o password errati'
            render :new
        end
    end
    
    def destroy
        session[:admin_id] = nil
        redirect_to backend_login_path
    end
end
