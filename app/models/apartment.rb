class Apartment < ApplicationRecord
    belongs_to :area
    has_one_attached :main_image
    has_many_attached :images
end
