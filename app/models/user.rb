class User < ActiveRecord::Base
  #All the user information is located in the users table, load it
  self.table_name = "users"
  # We obtain information from the SSO Login
end
