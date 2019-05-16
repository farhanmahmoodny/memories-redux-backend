class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :image, :location, :description, :memory_id

  has_one :memory
  has_many :comments
end
