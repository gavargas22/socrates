class Section < ActiveRecord::Base
  has_many :courses

  # Get the value of the section id
end
