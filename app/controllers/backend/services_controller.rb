class Backend::ServicesController < BackendController
    before_action :authenticate_admin!

    def index
        @services = Service.all
    end

    def new
        @service = Service.new
    end

    def create
        @service = Service.new(service_params)
        if @service.save
            flash.notice = 'Servizio creato con successo'
            redirect_to backend_services_path
        else
            render :new
        end
    end

    private

    def service_params
        params.require(:service).permit(:name)
    end
end
