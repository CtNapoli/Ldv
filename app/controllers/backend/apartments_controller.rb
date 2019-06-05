class Backend::ApartmentsController < BackendController
    skip_before_action :verify_authenticity_token, only: [:create, :update]
    before_action :authenticate_admin!
    before_action :load_apartment, only: [:edit, :update, :destroy, :remove_main_photo, :remove_photo, :add_price_range, :remove_price_range, :edit_price_range, :update_price_range]
    
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
            redirect_to backend_apartments_path
        else
            render :new
        end
    end

    def edit
    
    end

    def update
        if @apartment.update(apartment_params)
            flash.notice = 'Appartamento modificato con successo'
            redirect_to backend_apartments_path
        else
            render :edit
        end
    end

    def destroy
        @apartment.destroy
        redirect_to backend_apartments_path
    end

    def remove_main_photo
        @id = @apartment.main_image.id
    end

    def remove_photo
    
    end

    def add_price_range
        @success = false
        @price = Price.new(start: params[:start], end: params[:end], value: params[:value], apartment_id: @apartment.id)

        @success = @price.save unless @price.range_already_exist?(@apartment)

        respond_to do |format|
            format.js
        end
    end

    def remove_price_range
        @price = @apartment.prices.find_by_id(params[:price_id])
        @price.delete

        respond_to do |format|
            format.js
        end
    end

    def edit_price_range
        @price = @apartment.prices.find_by_id(params[:price_id])

        respond_to do |format|
            format.js
        end
    end

    def update_price_range
        @price = @apartment.prices.find_by_id(params[:price_id])

        @success = @price.update(value: params[:price][:value])
        
        respond_to do |format|
            format.js
        end
    end

    def load_apartment
        @apartment = Apartment.friendly.find(params[:id])
    end

    private

    def apartment_params
        params.require(:apartment).permit(:name, :address, :postal_code, :city, :province, :lat, :lng, :capacity, :square_meters, :rooms, :bedrooms, :toilette, :area_id, :main_image, :in_evidence, :published, :content, :images => [], :service_ids => [])
    end
end
