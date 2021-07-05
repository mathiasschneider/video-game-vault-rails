class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :lists

  has_many :lists
end