class DropTableEventPhotos < ActiveRecord::Migration
  def self.up
    drop_table("event_photos")
  end

  def self.down
  end
end
