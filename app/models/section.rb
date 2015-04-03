class Section < ActiveRecord::Base
  has_many :courses
  has_one :subject
  # Get the value of the section id
end
