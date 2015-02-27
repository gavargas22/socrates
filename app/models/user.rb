class User < ActiveRecord::Base
  # All the user information is located in the users table, load it
  self.table_name = "users"

  # We obtain information from the SSO Login
  # Return a User with SSO information
	def self.from_sso(utep_cookie, utep_salt)
		sso_response = UTEPSSO.authenticate(utep_cookie, utep_salt)

		user ||= User.find_by(username: sso_response[:user_name])

		unless user
			user.name = sso_response[:full_name]
			user.username = sso_response[:user_name]
			user.slug = sso_response[:user_name]
			user.email = sso_response[:email_address]
			user.params = " "
			user.save!

			# mailboxer_name_var = sso_response[:username]
			# mailboxer_email_var = sso_response[:email_address]
		end

		return user
	end
end
