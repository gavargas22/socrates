require 'utep_sso'

class User < ActiveRecord::Base
  #The table is the users table so load it.
  self.table_name = "users"

  # We need a function to obtain the users from SSO
  def self.from_sso(utep_cookie, utep_salt)
    sso_response = UTEPSSO.authenticate(utep_cookie, utep_salt)

    user = User.find_by_email(sso_response[:email_address])

    return user if user

    user = User.new
    user.name = sso_response[:full_name]
    user.email = sso_response[:email_address]
    role = sso_response[:role_value].to_i
    user.save!

    if((role & 16) == 16)
      student = Student.new
      student.user_id = user.id
      student.save!
    end

    if((role & 4) == 4)
      faculty = Faculty.new
      faculty.user_id = user.id
      faculty.save!
    end

    if((role & 2) == 2)
      staff = Staff.new
      staff.user_id = user.id
      staff.save!
    end

    return user
    #create specific model
  end
end
