class RequestMailer < ApplicationMailer
    default from: "info@ldvhomes.com"

    def request_sent
        @request = params[:request]
        @to = 'info@ldvhomes.com'
        @subject = 'Richiesta da website'
        mail(to: @to, subject: @subject)
    end
end
