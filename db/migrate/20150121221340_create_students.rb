class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :students, :user_id, unique: true
  end
end
