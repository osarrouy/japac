class RenameProjectPhotosInPhotos < ActiveRecord::Migration
  def self.up
    rename_column 'project_photos', 'reference_id', 'attachable_id'
    add_column    'project_photos', 'attachable_type', :string
    rename_table  'project_photos', 'photos'
    
  end

  def self.down
    rename_table  'photos', 'project_photos'
    remove_column 'project_photos', 'attachable_type'
    rename_column 'project_photos', 'attachable_id', 'reference_id'
  end
end
