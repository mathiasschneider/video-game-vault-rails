class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :public, :list_games

  belongs_to :user
  has_many :list_games
end
