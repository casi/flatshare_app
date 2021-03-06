# frozen_string_literal: true

class User < ApplicationRecord
  has_many :infos
  has_many :comments

  before_save :downcase_email

  default_scope -> { where('id > 0').order(created_at: :desc) }
  mount_uploader :picture, PictureUploader

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validate :picture_size

  # Returns the hash digest of the given string. (for fixtures)
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  # validates the size of an uploaded picture
  def picture_size
    errors.add(:picture, 'should be less than 5 MB') unless picture.size < 5.megabytes
  end
end
