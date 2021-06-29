class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email

  # has_many :lists, if: :current_user
end