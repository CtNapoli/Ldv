class Backend::AreasController < BackendController
    skip_before_action :verify_authenticity_token, only: [:update]
    before_action :authenticate_admin!
    before_action :load_area, only: [:edit, :update, :remove_main_photo, :remove_photo]

    def index
        @areas = Area.all
    end

    def new
        @area = Area.new
    end

    def create
        @area = Area.new(area_params)
        if @area.save
            flash.notice = t('backend.services.created', service: @area.name)
            redirect_to backend_areas_path
        else
            render :new
        end
    end

    def edit
    
    end

    def update
        if @area.update(area_params)
            flash.notice = t('backend.areas.created', area: @area.name)
            redirect_to backend_areas_path
        else
            render :edit
        end
    end

    def remove_main_photo
        @id = @area.image.id
    end

    def remove_photo
    
    end

    def load_area
        @area = Area.friendly.find(params[:id])
    end

    private

    def area_params
        params.require(:area).permit(:name, :description, :content, :image, :images => [])
    end
end
