class Item < ActiveRecord::Base
    mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
    validates :name, presence: true # Make sure the file name is present.
    validates :attachment, presence: true # Make sure a file is uploaded
    belongs_to  :user
    belongs_to  :folder
end
