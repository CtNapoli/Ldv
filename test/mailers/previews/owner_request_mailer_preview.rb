# Preview all emails at http://localhost:3000/rails/mailers/owner_request_mailer
class OwnerRequestMailerPreview < ActionMailer::Preview
    def owner_request_sent
        OwnerRequestMailer.with(owner_request: OwnerRequest.first).owner_request_sent
    end
end
