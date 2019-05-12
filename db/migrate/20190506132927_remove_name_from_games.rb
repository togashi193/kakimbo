class RemoveNameFromGames < ActiveRecord::Migration[6.0]
  def change

    remove_column :games, :name, :string
  end
end
