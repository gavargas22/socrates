class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user_id, index: true
      t.references :course_id, index: true

      t.timestamps null: false
    end
    add_foreign_key :questions, :user_ids
    add_foreign_key :questions, :course_ids
  end
end
