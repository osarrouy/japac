class CreateTableProjectPhotosFu < ActiveRecord::Migration
  def self.up
      create_table :project_photos do |t|
        t.column :name, :string
        t.column :description, :text
        t.column :parent_id,  :integer
        t.column :content_type, :string
        t.column :filename, :string    
        t.column :thumbnail, :string 
        t.column :size, :integer
        t.column :width, :integer
        t.column :height, :integer
      end
    end

    def self.down
      drop_table :project_photos
    end

end