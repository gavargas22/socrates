class Faculty < ActiveRecord::Base
  belongs_to :user
  has_many :courses
end
