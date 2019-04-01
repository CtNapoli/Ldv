class Backend::ServicesController < BackendController
    before_action :authenticate_admin!
    before_action :load_service, only: [:edit, :update]

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

    def edit
    
    end

    def update
        if @service.update(service_params)
            flash.notice = 'Servizio modificato con successo'
            redirect_to backend_edit_service_path(@service)
        else
            render :edit
        end
    end

    def load_service
        @service = Service.friendly.find(params[:id])
    end

    private

    def service_params
        params.require(:service).permit(:name)
    end
end
