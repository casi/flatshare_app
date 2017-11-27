class Info < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true

  default_scope -> { order(created_at: :desc) }
  scope :not_archived, -> { where(archived: false).order(created_at: :desc) }
  scope :archived, -> { where(archived: true).order(created_at: :desc) }
  
  validates :title, presence: true
  validates :content, presence: true
end
