class AddCourseToFolder < ActiveRecord::Migration
  def change
    add_column :folders, :course, :string
  end
end
