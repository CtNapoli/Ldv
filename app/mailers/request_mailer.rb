class RequestMailer < ApplicationMailer
    default from: "ldvwebsite1@gmail.com"

    def request_sent
        @request = params[:request]
        @to = ['info@ldvhomes.com', 'vittorioacampora@ldvhomes.com', 'marcoderosa@ldvhomes.com']
        @subject = 'Richiesta da website'
        mail(to: @to, subject: @subject)
    end
end
