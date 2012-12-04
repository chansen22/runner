class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string :url
      t.boolean :verified
      t.string :category
      t.integer :time_in_seconds

      t.timestamps
    end
  end
end
