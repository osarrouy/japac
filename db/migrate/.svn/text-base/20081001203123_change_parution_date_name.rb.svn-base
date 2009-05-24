class ChangeParutionDateName < ActiveRecord::Migration
  def self.up
    drop_table :publications
    create_table :publications do |t|
      t.string :name
      t.date :publication_date

      t.timestamps
    end
  end

  def self.down
    drop_table :publications
    create_table :publications do |t|
      t.string :name
      t.date :parution_date

      t.timestamps
    end
  end
end

