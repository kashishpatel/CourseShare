class AddFolderIdToItems < ActiveRecord::Migration
  def self.up 
    add_column :items, :folder_id, :integer
    add_index :items, :folder_id
  end
  
  def self.down 
    remove_column :items, :folder_id
  end
end
