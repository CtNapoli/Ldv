class Apartment < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    belongs_to :area
    has_one_attached :main_image
    has_many_attached :images
    has_and_belongs_to_many :services, -> { distinct }
    has_and_belongs_to_many :prices, -> { distinct }

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

    validate :main_image_presence

    private

    def main_image_presence
        errors.add(:main_image, :blank) unless main_image.attached?
    end

end
