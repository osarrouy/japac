class DeleteEventThumbnail < ActiveRecord::Migration
  def self.up
    drop_table :event_thumbnails
  end

  def self.down
    create_table :event_thumbnails do |t|
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
end
