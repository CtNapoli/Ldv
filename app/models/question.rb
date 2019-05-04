class Question < ApplicationRecord
    extend FriendlyId
    friendly_id :request, use: :slugged

    validates :request, presence: true
    validates :reply, presence: true
end
