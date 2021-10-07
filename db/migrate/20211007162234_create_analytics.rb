class CreateAnalytics < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.string :lng
      t.string :lat
      t.timestamps
    end
  end
end
