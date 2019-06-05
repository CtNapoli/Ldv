class Area < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    translates :name, :description, :content, touch: true
    
    has_one_attached :image
    has_many_attached :images
    has_many :apartments

    validates :name, uniqueness: true, presence: true
    validates :description, presence: true

    validate :main_image_presence

    private

    def main_image_presence
        errors.add(:image, :blank) unless image.attached?
    end

    
end
