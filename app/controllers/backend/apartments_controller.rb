class Backend::ApartmentsController < BackendController
    before_action :authenticate_admin!
    before_action :load_apartment, only: [:edit, :update, :destroy, :remove_main_photo, :remove_photo]
    
    def index
        @apartments = Apartment.all
    end

    def new
        @apartment = Apartment.new
    end

    def create
        @apartment = Apartment.new(apartment_params)
        if @apartment.save
            flash.notice = 'Appartamento creato con successo'
            redirect_to backend_all_apartments_path
        else
            render :new
        end
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

    def destroy
        
    end

    def remove_main_photo
        @id = @apartment.main_image.id
    end

    def remove_photo
    
    end


    def load_apartment
        @apartment = Apartment.find(params[:id])
    end

    private

    def apartment_params
        params.require(:apartment).permit(:name, :address, :postal_code, :city, :province, :lat, :lng, :capacity, :square_meters, :rooms, :bedrooms, :toilette, :area_id, :main_image, :images => [], :service_ids => [])
    end
end
