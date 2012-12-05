class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
			t.references :run

      t.timestamps
    end
    add_index :comments, :run_id
  end
end
