class AddProjectIdToEvent < ActiveRecord::Migration
  def self.up
    add_column 'events', 'reference_id', :integer
  end

  def self.down
    remove_column 'events', 'reference_id'
  end
end
