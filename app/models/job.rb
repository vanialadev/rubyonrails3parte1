class Job < ApplicationRecord
    scope :most_recent, -> {
        order("created_at Desc")
    }
    has_many :comments
    validates :title, :description, presence: true
end
