class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :user_id, :photo_id

  has_one :user
  has_one :photo
end
