class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :user
      t.integer :followee_id

      t.timestamps
    end
    add_index :follows, :user_id
  end
end
