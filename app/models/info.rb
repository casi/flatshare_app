class Info < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true

  default_scope -> { order(created_at: :desc) }
  
  validates :title, presence: true
  validates :content, presence: true
end
