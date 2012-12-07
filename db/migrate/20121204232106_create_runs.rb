class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string :url
      t.boolean :verified
      t.string :category
      t.string :time_in_seconds
	t.references :game
      t.references :user

      t.timestamps
    end
    add_index :runs, :game_id
  end
end
