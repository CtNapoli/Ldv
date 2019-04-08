class Area < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    has_one_attached :image
    has_many_attached :images
    has_many :apartments

    validates :name, uniqueness: true
end
