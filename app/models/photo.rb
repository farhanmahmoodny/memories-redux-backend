class Photo < ApplicationRecord
  belongs_to :memory
  has_many :comments
  has_many :users, through: :comments
end
