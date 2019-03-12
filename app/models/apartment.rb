class Apartment < ApplicationRecord
    belongs_to :area
    has_one_attached :main_image
    has_many_attached :images
    has_and_belongs_to_many :services
end
