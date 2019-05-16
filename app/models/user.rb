class User < ApplicationRecord
  has_many :memories
  has_many :photos, through: :memories
  has_many :comments

  validates :email, uniqueness: true

  has_secure_password
end
