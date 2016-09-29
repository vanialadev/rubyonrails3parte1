class Comment < ApplicationRecord
    belongs_to :job
    validates :name, :body, :job_id, presence: true
end
