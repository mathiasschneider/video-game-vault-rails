class ListGame < ApplicationRecord
  belongs_to :list
  validates :list_id, presence: true
  validates :igdb_game_id, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 } 
end