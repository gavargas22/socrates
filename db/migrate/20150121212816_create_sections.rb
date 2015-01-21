class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :department
      t.string :number

      t.timestamps null: false
    end
  end
end
