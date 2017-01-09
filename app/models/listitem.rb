class Listitem < ApplicationRecord
  
  default_scope -> { order(created_at: :asc) }

  #scope :todo, -> { where(todo: true) }
  #scope :shopping, -> { where(shopping: true) }
  scope :done, -> { where(done: true) }

  validates :item, presence: true
end
