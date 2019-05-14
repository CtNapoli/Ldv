class Service < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    translates :name
    
    has_and_belongs_to_many :apartments, -> { distinct }
    
    validates :name, uniqueness: true
end
