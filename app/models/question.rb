class Question < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :course_id
  has_surveys
end
