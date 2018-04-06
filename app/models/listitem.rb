class Listitem < ApplicationRecord
  default_scope -> { order(created_at: :asc) }
  scope :done, -> { where(done: true) }

  validates :item, presence: true
end
