class Backend::ServicesController < BackendController
    skip_before_action :verify_authenticity_token, only: [:create, :update]
    before_action :authenticate_admin!
    before_action :load_service, only: [:edit, :update, :destroy]

    def index
        @service_name = params[:service_name]

        #@services = Service.order('created_at DESC').page params[:page]
        #@services = Service.with_translations(I18n.locale).where("service_translations.name ILIKE ?", "%#{@service_name}%") if @service_name.present?
    
        if params[:service_name]
            @services = Service.with_translations(I18n.locale).order('updated_at DESC').page params[:page]

            if @service_name.present?
                @services = @services.where("service_translations.name ILIKE ?", "%#{@service_name}%")
            end
        else
            @services = Service.all.order('updated_at DESC').page params[:page]
        end
    end

    def new
        @service = Service.new
    end

    def create
        @service = Service.new(service_params)
        if @service.save
            flash.notice = t('backend.services.created', service: @service.name)
            redirect_to backend_services_path
        else
            render :new
        end
    end

    def edit
    
    end

    def update
        if @service.update(service_params)
            flash.notice = t('backend.services.edited', service: @service.name)
            redirect_to backend_services_path
        else
            render :edit
        end
    end

    def destroy
        @service.destroy
        flash.alert = t('backend.services.removed', service: @service.name)
        redirect_to backend_services_path
    end

    def load_service
        @service = Service.friendly.find(params[:id])
    end

    private

    def service_params
        params.require(:service).permit(:name)
    end
end
