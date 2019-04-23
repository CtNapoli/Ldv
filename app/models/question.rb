class Question < ApplicationRecord
    validates :request, presence: true
    validates :reply, presence: true
end
