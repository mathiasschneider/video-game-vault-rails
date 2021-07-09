class AddTitleToListGames < ActiveRecord::Migration[6.1]
  def change
    add_column :list_games, :title, :string
    add_column :list_games, :image_url, :string
  end
end
