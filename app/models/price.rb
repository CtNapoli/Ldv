class Price < ApplicationRecord
    has_and_belongs_to_many :apartments, -> { distinct }
end
