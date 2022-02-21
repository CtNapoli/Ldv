class OwnerRequestMailer < ApplicationMailer
    default from: "ldvwebsite1@gmail.com"

    def owner_request_sent
        @owner_request = params[:owner_request]
        @to = ['info@ldvhomes.com', 'vittorioacampora@ldvhomes.com', 'marcoderosa@ldvhomes.com', 'mdr.marketing@yahoo.co.uk', 'luigipiccolo.lpl@gmail.com']
        @subject = 'Richiesta partnership'
        mail(to: @to, subject: @subject)
    end
end
