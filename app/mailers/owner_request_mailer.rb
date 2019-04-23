class OwnerRequestMailer < ApplicationMailer
    default from: "ldvwebsite1@gmail.com"

    def owner_request_sent
        @owner_request = params[:owner_request]

        if Rails.env.production?
            @to = 'info@ldv.it'
        else
            @to = 'criscialfonso92@gmail.com'
        end
        
        @subject = 'Richiesta partnership'
        mail(to: @to, subject: @subject)
    end
end
