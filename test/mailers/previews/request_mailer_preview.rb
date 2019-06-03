# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview
    def request_sent
        RequestMailer.with(request: Request.last).request_sent
    end
end
