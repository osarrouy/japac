class ModifyCity < ActiveRecord::Migration
  def self.up
    remove_column 'cities', 'department'
    rename_table  'cities', 'locations'
  end

  def self.down
    rename_table  'locations', 'cities'
    add_column    'cities', 'department', :integer
  end
end
