class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.text :team_left
      t.text :team_center
      t.text :team_right
      t.text :hardware_left
      t.text :hardware_center
      t.text :hardware_right
      t.text :contact

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
