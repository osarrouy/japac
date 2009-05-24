class ChangeDescriptionColumnNamesInProjects < ActiveRecord::Migration
  def self.up
    drop_table :projects
    create_table :projects do |t|
      t.string :name
      t.text  :column_left
      t.text  :column_center
      t.text  :column_right
      t.integer :city_id
    end
  end

  def self.down
    drop_table :projects
    create_table :projects do |t|
      t.string :name
      t.text :technical_description
      t.text :architectural_description
      t.text :surface_description
      t.integer :city_id
    end
  end
end
