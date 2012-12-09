class AddAttachmentCoverartToGames < ActiveRecord::Migration
  def self.up
    change_table :games do |t|
      t.has_attached_file :coverart
    end
  end

  def self.down
    drop_attached_file :games, :coverart
  end
end
