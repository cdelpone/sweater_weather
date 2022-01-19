class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, on: :create
  validates :password_digest, presence: true

  has_secure_password

  def self.api_key
    SecureRandom.hex 12
  end
end
