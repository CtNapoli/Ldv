class Area < ApplicationRecord
    has_one_attached :image

    validates :name, uniqueness: true
end
