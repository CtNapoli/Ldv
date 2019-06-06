class Question < ApplicationRecord
    extend FriendlyId
    friendly_id :request, use: :slugged
    translates :request, :reply

    validates :request, presence: true
    validates :reply, presence: true
end
