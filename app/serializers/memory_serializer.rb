class MemorySerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :user_id

  has_one :user
  has_many :photos
end
