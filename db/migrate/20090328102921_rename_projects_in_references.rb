class RenameProjectsInReferences < ActiveRecord::Migration
  def self.up
    rename_table('projects', 'references')
  end

  def self.down
    rename_table('references', 'projects')
  end
end
