class Apartment < ApplicationRecord
    belongs_to :area
    has_one_attached :main_image
end
