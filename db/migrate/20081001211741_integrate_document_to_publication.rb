class IntegrateDocumentToPublication < ActiveRecord::Migration
  def self.up
    drop_table :publications
    drop_table :parution_documents
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

  def self.down
    drop_table :publications
    create_table :publications do |t|
      t.string :name
      t.date :parution_date
      t.timestamps
    end
    drop_table :parution_documents
    create_table :parution_documents do |t|
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
