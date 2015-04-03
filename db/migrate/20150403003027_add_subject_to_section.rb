class AddSubjectToSection < ActiveRecord::Migration
  def change
    add_reference :sections, :subject, index: true
    add_foreign_key :sections, :subjects
  end
end
