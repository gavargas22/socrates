class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :short_name
      t.references :section, index: true

      t.timestamps null: false
    end
    add_foreign_key :subjects, :sections
  end
end
