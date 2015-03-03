class SessionsController < ApplicationController
	def create
	  user = User.from_sso(cookies[:UTEP_SE], cookies[:UTEP_SA])
	  if user
	    session[:user_id] = user.id
	  end
	  redirect_to dashboard_index_path
	end

	def destroy
	  session[:user_id] = nil
	  UTEPSSO.deauthenticate(cookies[:UTEP_SE], cookies[:UTEP_SA])
	  redirect_to root_url
	end

end
