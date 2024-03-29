require 'utep_sso'

class User < ActiveRecord::Base

	has_many :subscriptions
	has_many :subscribed_courses, through: :subscriptions, source: :course

	extend FriendlyId
	friendly_id :username, use: :slugged

	#The table is the users table so load it.
	self.table_name = "users"

	# We need a function to obtain the users from SSO the from_sso function takes two parameters utep_cookie and utep_salt
	def self.from_sso(utep_cookie, utep_salt)
		if(UTEPSSO.authenticated?(utep_cookie, utep_salt))
			# Save the response of the utep_sso gem in a variable
			sso_response = UTEPSSO.authenticate(utep_cookie, utep_salt)

			# check if the user when found by email_address property exists and if it does return the user
			user = User.find_by_email(sso_response[:email_address])
			return user if user

			#Else create a new user object with the information stored in the sso_response and save to the database.
			user = User.new
			user.name = sso_response[:full_name]
			user.email = sso_response[:email_address]
			user.username = user.email[/[^@]+/]
			user.slug = user.email[/[^@]+/]
			role = sso_response[:role_value].to_i
			user.save!

			# This is the part where we create the user objects of type student, staff, or faculty.
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
		end
	end

	# =============================== Subscription functions ====================================

	# Subscribes to a course
	def subscribe(course)
		subscriptions.create(course_id: course.id)
	end

	# Unsubscribes from event
	def unsubscribe(course)
		subscriptions.find_by(course_id: course.id).destroy
	end

	# Returns true if current user is subscribed to the event
	def subscribed?(course)
		subscribed_courses.include?(course)
	end

end
