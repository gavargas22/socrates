class Course < ActiveRecord::Base
  belongs_to :section
  has_one :faculty
  has_and_belongs_to_many :students
  has_secure_password

end
