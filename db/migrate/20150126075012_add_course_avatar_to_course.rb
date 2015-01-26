class AddCourseAvatarToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :course_avatar, :string
  end
end
