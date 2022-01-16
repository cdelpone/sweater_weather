class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, on: :create
  validates :password_digest, presence: true

  has_secure_password
end
