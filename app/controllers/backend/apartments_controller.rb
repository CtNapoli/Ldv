class Backend::ApartmentsController < BackendController
    skip_before_action :verify_authenticity_token, only: [:create, :update]
    before_action :authenticate_admin!
    before_action :load_all_areas, only: [:index]
    before_action :load_apartment, only: [:edit, :update, :destroy, :remove_main_photo, :remove_photo, :add_price_range, :remove_price_range, :edit_price_range, :update_price_range]
    
    def index
        @apartment_area = params[:apartment_area]
        @founded_area = Area.with_translations(I18n.locale).where("cast(area_translations as text) ilike ?", "%#{@apartment_area}%").last
        @apartment_name = params[:apartment_name]
        
        @apartment_status = true if params[:apartment_status] == "1" 
        @apartment_status = false if params[:apartment_status] == "0"
        @apartment_status = "" if params[:apartment_status] == ""


        if params[:apartment_area] && params[:apartment_name] && params[:apartment_status]
            @apartments = Apartment.with_translations(I18n.locale).order('updated_at DESC').page params[:page]

            if @apartment_area.present? && @apartment_name.present? && @apartment_status != ""
                @apartments = @apartments.where('apartment_translations.name ILIKE ?', "%#{@apartment_name}%").where(area_id: @founded_area, published: @apartment_status)
            end
    
            if @apartment_area.present? && @apartment_name.blank? && @apartment_status == ""
                @apartments = @apartments.where(area_id: @founded_area)
            end
            
            if @apartment_name.present? && @apartment_area.blank? && @apartment_status == ""
                @apartments = @apartments.where('apartment_translations.name ILIKE ?', "%#{@apartment_name}%")
            end
    
            if @apartment_status != "" && @apartment_name.blank? && @apartment_area.blank?
                @apartments = @apartments.where(published: @apartment_status)
            end
    
            if @apartment_status != "" && @apartment_name.present? && @apartment_area.blank?
                @apartments = @apartments.where('apartment_translations.name ILIKE ?', "%#{@apartment_name}%").where(published: @apartment_status)
            end
    
            if @apartment_status != "" && @apartment_area.present? && @apartment_name.blank? 
                @apartments = @apartments.where(area_id: @founded_area, published: @apartment_status)
            end
        else
            @apartments = Apartment.all.order('updated_at DESC').page params[:page]
        end

        
    end

    def new
        @apartment = Apartment.new
    end

    def create
        @apartment = Apartment.new(apartment_params)
        if @apartment.save
            flash.notice = t('backend.apartments.created', apartment: @apartment.name)
            redirect_to edit_backend_apartment_path(@apartment)
        else
            render :new
        end
    end

    def edit
    
    end

    def update
        if @apartment.update(apartment_params)
            flash.notice = t('backend.apartments.edited', apartment: @apartment.name)
            redirect_to edit_backend_apartment_path(@apartment)
        else
            render :edit
        end
    end

    def destroy
        @apartment.destroy
        flash.alert = t('backend.apartments.removed', apartment: @apartment.name)
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

    def load_all_areas
        @all_areas = Area.with_translations(I18n.locale).all
    end

    private

    def apartment_params
        params.require(:apartment).permit(:name, :address, :postal_code, :city, :province, :lat, :lng, :capacity, :square_meters, :rooms, :bedrooms, :toilette, :area_id, :main_image, :in_evidence, :published, :content, :price_default, :price_cleaning_service, :images => [], :service_ids => [])
    end
end
