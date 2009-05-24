class ModifyReferenceForLocation < ActiveRecord::Migration
  def self.up
    rename_column "references", "city_id", "location_id"
  end

  def self.down
    rename_column "references", "location_id", "city_id"
  end
end
