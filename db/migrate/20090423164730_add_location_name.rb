class AddLocationName < ActiveRecord::Migration
  def self.up
    add_column 'events', 'location_name', :string
  end

  def self.down
  end
end
