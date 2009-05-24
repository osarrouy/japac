class RemoveLocationName < ActiveRecord::Migration
  def self.up
    remove_column 'events', 'location_name'
  end

  def self.down
  end
end
