class OwnerRequestMailer < ApplicationMailer
    default from: "info@ldvhomes.com"

    def owner_request_sent
        @owner_request = params[:owner_request]
        @to = 'info@ldvhomes.com'
        @subject = 'Richiesta partnership'
        mail(to: @to, subject: @subject)
    end
end
