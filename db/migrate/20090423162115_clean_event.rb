class CleanEvent < ActiveRecord::Migration
  def self.up
    remove_column 'events', "city_id"
    remove_column 'events', "event_photo_id"
    remove_column 'events', "event_thumbnail_id"
    remove_column 'events', "project_id"
    add_column    'events', 'location_name', :string
  end

  def self.down
    add_column 'events', "city_id", :integer
    add_column 'events', "event_photo_id", :integer
    add_column 'events', "event_thumbnail_id", :integer
    add_column 'events', "project_id", :integer
    remove_column    'events', 'location_name'
  end
end
