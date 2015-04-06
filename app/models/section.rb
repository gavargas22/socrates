class Section < ActiveRecord::Base
	has_many :courses
	belongs_to :subject

	accepts_nested_attributes_for :subject

end
