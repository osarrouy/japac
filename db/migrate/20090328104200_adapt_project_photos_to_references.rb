class AdaptProjectPhotosToReferences < ActiveRecord::Migration
  def self.up
    rename_column('project_photos', 'project_id', 'reference_id')
  end

  def self.down
    rename_column('project_photos', 'reference_id', 'project_id')
  end
end
