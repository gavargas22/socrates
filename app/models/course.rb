class Course < ActiveRecord::Base
  belongs_to :section
  has_one :faculty
  has_secure_password

end
