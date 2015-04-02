class Section < ActiveRecord::Base
  has_many :courses
  belongs_to :subject
  # Get the value of the section id
end
