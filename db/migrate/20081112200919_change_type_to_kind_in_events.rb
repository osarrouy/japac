class ChangeTypeToKindInEvents < ActiveRecord::Migration
  def self.up
    drop_table :events
    create_table :events do |t|
      t.string  :name
      t.date    :date
      t.integer :city_id
      t.integer :event_photo_id
      t.integer :event_thumbnail_id
      t.text    :kind 
      t.text    :column_left
      t.text    :column_center
      t.text    :column_right
    end
  end

  def self.down
    drop_table :events
    create_table :events do |t|
      t.string  :name
      t.date    :date
      t.integer :city_id
      t.integer :event_photo_id
      t.integer :event_thumbnail_id
      t.text    :type 
      t.text    :column_left
      t.text    :column_center
      t.text    :column_right
    end
  end
end
