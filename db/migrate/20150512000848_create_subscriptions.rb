class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :subscriber_id

      t.timestamps null: false
    end
    add_index :subscriptions, [:subscriber_id], unique: true
  end
end
