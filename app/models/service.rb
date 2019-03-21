class Service < ApplicationRecord
    has_and_belongs_to_many :apartments, -> { distinct }
    
    validates :name, uniqueness: true
end
