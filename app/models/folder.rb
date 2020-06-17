class Folder < ActiveRecord::Base
    acts_as_tree
    belongs_to :user
    belongs_to :folder
    has_many :items, :dependent => :destroy
    has_many :shared_folders, :dependent => :destroy
    #a method to check if a folder has been shared or not 
    def shared? 
        !self.shared_folders.empty? 
    end
end
