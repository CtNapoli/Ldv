class RequestMailer < ApplicationMailer
    default from: "ldvwebsite1@gmail.com"

    def request_sent
        @request = params[:request]

        if Rails.env.production?
            @to = 'info@ldv.it'
        else
            @to = 'criscialfonso92@gmail.com'
        end
        
        @subject = 'Richiesta da website'
        mail(to: @to, subject: @subject)
    end
end
