class ListGameSerializer < ActiveModel::Serializer
  attributes :id, :list_id, :igdb_game_id, :quantity

  belongs_to :list
  belongs_to :game
end
