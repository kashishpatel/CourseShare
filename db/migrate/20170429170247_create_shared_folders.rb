class CreateSharedFolders < ActiveRecord::Migration
  def change
    create_table :shared_folders do |t|
      t.integer :user_id
      t.string :shared_email
      t.integer :shared_user_id
      t.integer :folder_id
      t.string :message

      t.timestamps null: false
    end
    
    add_index :shared_folders, :user_id
    add_index :shared_folders, :shared_user_id
    add_index :shared_folders, :folder_id
  end
  
  def self.down 
    drop_table :shared_folders
  end
end