class AddTreasureRecord < ActiveRecord::Migration[6.0]
  def up
    Treasure.first_or_create(lat: '19.945704' , lng: '50.051227')
  end

  def down
  end
end
