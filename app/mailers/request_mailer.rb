class RequestMailer < ApplicationMailer
    default from: "ldvwebsite1@gmail.com"

    def request_sent
        @request = params[:request]
        @to = ['info@ldvhomes.com', 'marcoderosa@ldvhomes.com', 'mdr.marketing@yahoo.co.uk', 'luigipiccolo.lpl@gmail.com']
        @subject = 'Richiesta da website'
        mail(to: @to, subject: @subject)
    end

    def request_selling
        @request = params[:request]
        @to = ['info@ldvhomes.com', 'marcoderosa@ldvhomes.com', 'mdr.marketing@yahoo.co.uk', 'luigipiccolo.lpl@gmail.com']
        @subject = 'Richiesta informazioni appartamento in vendita'
        mail(to: @to, subject: @subject)
    end
end
