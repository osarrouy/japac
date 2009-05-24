class AddGoeInfoToCity < ActiveRecord::Migration
  def self.up
    add_column 'cities', 'lat', :float
    add_column 'cities', 'lng', :float
    add_column 'cities', 'full_address', :string
  end

  def self.down
    remove_column 'cities', 'lat', :float
    remove_column 'cities', 'lng', :float
    remove_column 'cities', 'full_address', :string
  end
end
