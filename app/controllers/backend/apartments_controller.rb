class Backend::ApartmentsController < BackendController
    before_action :authenticate_admin!
    def index
        @apartments = Apartment.all
    end
end
