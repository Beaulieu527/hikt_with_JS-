class Review < ApplicationRecord
    belongs_to :user
    belongs_to :hike
    validates :content, presence: true
end
