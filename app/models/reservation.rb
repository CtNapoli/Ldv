class Reservation < ApplicationRecord
    belongs_to :apartment

    enum accepted: { no: 0, yes: 50 }

    validates :date, presence: true
    validates :guests, presence: true
    validates :accepted, presence: true

end
