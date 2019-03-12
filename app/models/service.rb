class Service < ApplicationRecord
    has_and_belongs_to_many :apartments
    
    validates :name, uniqueness: true
end
