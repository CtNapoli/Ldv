class Reservation < ApplicationRecord
    belongs_to :apartment

    enum status: { refused: 0, waiting: 50, confirmed: 100 }

    validates :date_start, presence: true
    validates :date_end, presence: true
    validates :guests, presence: true
    validates :name, presence: true
    validates :email, presence: true
    validates :phone_number, presence: true
    validates :total_price, presence: true

    def future?
        date_end.future?
    end

    def accept!
        update(status: 'confirmed') if self.status == 'waiting' && future?
    end

    def reject!
        update(status: 'refused') if future?
    end

end
