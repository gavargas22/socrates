class RenameCourseStudentsToCoursesStudents < ActiveRecord::Migration
  def change
    rename_table :course_students, :courses_students
  end
end
