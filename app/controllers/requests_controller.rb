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

    # def request_form
    #     @request = Request.new
    # end
    
    def create_request
        puts 'sono prima di @request'
        #@request = Request.new(request_params[:request])
        @success = false
        @request = Request.new(request_params)
        puts 'Sono dopo il @request'
        puts @request.inspect
    
        if @request.save
            @success = true
            RequestMailer.with(request: @request).request_sent.deliver_now
        end
        respond_to do |format|
            format.js{}
        end
        # respond_to do |format|
        #   if @request.save
        #     format.js { @success = true }
        #   else
        #     format.js { @success = false }
        #   end
        # end
    end

    private

    def request_params
        params.permit(:name, :email, :phone_number, :message)
    end
end
