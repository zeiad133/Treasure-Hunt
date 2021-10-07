class CreateTreasreHunt < ActiveRecord::Migration[6.0]
  def change
    create_table :treasures do |t|
        t.string :lng
        t.string :lat
        t.integer :number_of_winners, default: 0
        t.timestamps
      end
  end
end
