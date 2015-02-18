class Course < ActiveRecord::Base
  extend FriendlyId
  friendly_id :crn, use: :slugged

  belongs_to :section
  has_one :faculty
  has_and_belongs_to_many :students
  has_secure_password
  mount_uploader :course_avatar, CourseAvatarUploader

  def get_section_id
    @section = Section.find(:id)
    return "45"
  end
end
