class AddSurveysToCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :survey, index: true
    add_foreign_key :courses, :surveys
  end
end
