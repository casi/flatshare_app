class Info < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  
  validates :author, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
