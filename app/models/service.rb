class Service < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    has_and_belongs_to_many :apartments, -> { distinct }
    
    validates :name, uniqueness: true
end
