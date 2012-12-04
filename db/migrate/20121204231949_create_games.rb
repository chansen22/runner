class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :system
      t.integer :release_year
      t.string :publisher
      t.string :series

      t.timestamps
    end
  end
end
