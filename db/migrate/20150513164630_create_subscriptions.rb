class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :course_id
      t.references :user, index: true
      t.references :course, index: true

      t.timestamps null: false
    end
    add_foreign_key :subscriptions, :users
    add_foreign_key :subscriptions, :courses
  end
end
