class Backend::AreasController < ApplicationController
    before_action :authenticate_admin!
    before_action :load_area, only: [:edit, :update, :remove_main_photo, :remove_photo]

    def index
        @area = Area.all
    end

    def edit
    
    end

    def update
        if @apartment.update(apartment_params)
            flash.notice = 'Appartamento modificato con successo'
            redirect_to backend_edit_apartment_path(@apartment)
        else
            render :edit
        end
    end

    def remove_main_photo
        @id = @apartment.main_image.id
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
