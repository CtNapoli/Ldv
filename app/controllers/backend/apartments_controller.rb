class Backend::ApartmentsController < BackendController
    before_action :authenticate_admin!
    before_action :load_apartment, only: [:edit, :update, :destroy]
    
    def index
        @apartments = Apartment.all
    end

    def create
    
    end

    def new
        
    end

    def edit
    
    end

    def update
    
    end

    def destroy
        
    end


    def load_apartment
        @apartment = Apartment.find(params[:id])
    end
end
