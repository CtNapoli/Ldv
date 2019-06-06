class Request < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :phone_number, format: {with: /\A[0-9]+\z/}
    validates :message, presence: true
end
