class Backend::ServicesController < BackendController
    before_action :authenticate_admin!

    def index
        @services = Service.all
    end
end
