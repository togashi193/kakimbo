class AddNameToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :name, :string, after: :id
  end
end
