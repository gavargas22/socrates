class Course < ActiveRecord::Base
  extend FriendlyId
  # Use the CRN for easy URL access
  friendly_id :crn, use: :slugged
  
  # Associations
  belongs_to :section
  has_one :faculty
  has_and_belongs_to_many :students

  has_secure_password
  # Course Avatar
  mount_uploader :course_avatar, CourseAvatarUploader

end
