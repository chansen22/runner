class CreateModerates < ActiveRecord::Migration
  def change
    create_table :moderates do |t|
      t.references :user
      t.references :game

      t.timestamps
    end
    add_index :moderates, :user_id
    add_index :moderates, :game_id
  end
end
