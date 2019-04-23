class OwnerRequestMailer < ApplicationMailer
    default from: "from@example.com"

    def owner_request_sent
        @owner_request = params[:owner_request]
        @to = 'info@ldv.it'
        @subject = 'Richiesta partnership'
        mail(to: @to, subject: @subject)
    end
end
