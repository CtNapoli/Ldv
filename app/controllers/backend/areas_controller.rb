class Backend::AreasController < ApplicationController
    before_action :authenticate_admin!
    before_action :load_area, only: [:edit, :update, :remove_main_photo, :remove_photo]

    def index
        @area = Area.all
    end

    def edit
    
    end

    def update
        if @area.update(area_params)
            flash.notice = 'Area modificata con successo'
            redirect_to backend_areas_path(@area)
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
        params.require(:apartment).permit(:name, :description, :content, :image, :images => [])
    end
end
