class Apartment < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    translates :name, :content

    belongs_to :area
    has_one_attached :main_image
    has_many_attached :images
    has_and_belongs_to_many :services, -> { distinct }
    has_many :prices
    has_many :reservations, dependent: :delete_all

    validates :name, presence: true
    validates :address, presence: true
    validates :postal_code, presence: true
    validates :city, presence: true
    validates :province, presence: true
    validates :lat, presence: true
    validates :lng, presence: true
    validates :capacity, presence: true
    validates :square_meters, presence: true
    validates :rooms, presence: true
    validates :bedrooms, presence: true
    validates :toilette, presence: true
    validates :price_default, presence: true
    validates :price_cleaning_service, presence: true

    validate :main_image_presence

    def main_image_full_hd
        self.main_image.variant(resize: '1920x1080')
    end

    def busy_in_this_range?(from, to)
        self.reservations.where(status: 'confirmed', date_start: from.beginning_of_day..to.end_of_day).any?
    end

    def has_prices?
        self.prices.any?
    end

    private

    def main_image_presence
        errors.add(:main_image, :blank) unless main_image.attached?
    end
end
