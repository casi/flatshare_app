class Qanda < ApplicationRecord

  default_scope -> { order(created_at: :desc) }

  validates :question, presence: true
end
