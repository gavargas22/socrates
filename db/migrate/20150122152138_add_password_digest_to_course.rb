class AddPasswordDigestToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :password_digest, :string
    remove_column :courses, :password_hash
  end
end
