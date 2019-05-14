class Area < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    translates :name, :description, :content
    
    has_one_attached :image
    has_many_attached :images
    has_many :apartments

    validates :name, uniqueness: true, presence: true
    validates :description, presence: true
end
