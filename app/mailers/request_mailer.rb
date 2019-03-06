class RequestMailer < ApplicationMailer
    default from: "from@example.com"

    def request_sent
        @request = params[:request]
        @to = 'info@ldv.it'
        @subject = 'Richiesta da website'
        mail(to: @to, subject: @subject)
    end
end
