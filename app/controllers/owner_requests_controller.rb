class OwnerRequestsController < ApplicationController
    def create
        @success = false
        @owner_request = OwnerRequest.new(owner_request_params)
        if @owner_request.save
            @success = true
            OwnerRequestMailer.with(owner_request: @owner_request).owner_request_sent.deliver_now
        end
        respond_to do |format|
            format.js{}
        end
    end

    private

    def owner_request_params
        params.permit(:name, :city, :email, :phone_number, :message)
    end
end
