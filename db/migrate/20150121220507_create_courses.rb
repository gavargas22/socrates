class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :crn
      t.text :description
      t.string :password_hash
      t.integer :section_id
      t.integer :faculty_id

      t.timestamps null: false
    end
  end
end
