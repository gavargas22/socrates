class Section < ActiveRecord::Base
	has_many :courses
	belongs_to :subject
	validates_presence_of :subject

	accepts_nested_attributes_for :subject
end
