class RequestsController < ApplicationController
    def create
        @success = false
        @request = Request.new(request_params)
        if @request.save
            @success = true
            RequestMailer.with(request: @request).request_sent.deliver_now
        end
        respond_to do |format|
            format.js{}
        end
    end

    private

    def request_params
        params.permit(:name, :email, :phone_number, :message)
    end
end
