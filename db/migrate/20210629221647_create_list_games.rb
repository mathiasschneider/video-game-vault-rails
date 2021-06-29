class CreateListGames < ActiveRecord::Migration[6.1]
  def change
    create_table :list_games do |t|
      t.integer :list_id
      t.integer :igdb_game_id
      t.integer :quantity

      t.timestamps
    end
  end
end
