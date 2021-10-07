class AddTreasureFoundToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :treasure_found, :boolean, default: false
  end
end
