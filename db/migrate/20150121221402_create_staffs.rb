class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :staffs, :user_id, unique: true
  end
end
