class ListGameSerializer < ActiveModel::Serializer
  attributes :id, :list_id, :igdb_game_id, :quantity, :title, :image_url

  belongs_to :list
  belongs_to :game
end
