class Info < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true

  default_scope -> { includes(:user).order(created_at: :desc) }
  scope :not_archived, -> { includes(:user, :comments)
                            .where(archived: false)
                            .order(created_at: :desc)
                          }
  scope :archived, -> { includes(:user, :comments)
                        .where(archived: true)
                        .order(created_at: :desc)
                      }
  
  validates :title, presence: true
  validates :content, presence: true
end
