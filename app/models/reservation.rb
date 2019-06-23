class Reservation < ApplicationRecord
    belongs_to :apartment

    enum accepted: { no: 0, yes: 50 }

    validates :date_start, presence: true
    validates :date_end, presence: true
    validates :guests, presence: true
    validates :name, presence: true
    validates :email, presence: true
    validates :phone_number, presence: true

end
