class CreateEventThumbnail < ActiveRecord::Migration
  def self.up
    create_table :event_thumbnails do |t|
      t.column :name, :string
      t.column :event_id, :integer
      t.column :parent_id,  :integer
      t.column :content_type, :string
      t.column :filename, :string    
      t.column :thumbnail, :string 
      t.column :size, :integer
      t.column :width, :integer
      t.column :height, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :event_thumbnails
  end
end
