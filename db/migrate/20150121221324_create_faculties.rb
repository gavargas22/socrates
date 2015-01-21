class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :faculties, :user_id, unique: true
  end
end
