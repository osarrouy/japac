class AddDescriptionToPublications < ActiveRecord::Migration
  def self.up
    drop_table :publications
    create_table :publications do |t|
      t.column :name, :string
      t.column :description, :text
      t.column :date, :date
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
    drop_table :publications
    create_table :publications do |t|
      t.column :name, :string
      t.column :date, :date
      t.column :parent_id,  :integer
      t.column :content_type, :string
      t.column :filename, :string    
      t.column :thumbnail, :string 
      t.column :size, :integer
      t.column :width, :integer
      t.column :height, :integer
    end
  end
end
