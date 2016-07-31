class Comment < ApplicationRecord
  validates :user_id, presence: true
  validates :body, presence: true
  belongs_to :user
  belongs_to :info
end
