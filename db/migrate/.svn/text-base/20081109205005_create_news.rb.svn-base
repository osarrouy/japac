class CreateNews < ActiveRecord::Migration

  def self.up
    create_table :news do |t|
      t.string  :name
      t.date    :date
      t.integer :city_id
      t.integer :photo_id
      t.text    :column_left
      t.text    :column_center
      t.text    :column_right
    end
  end

  def self.down
    drop_table :news
  end
end
