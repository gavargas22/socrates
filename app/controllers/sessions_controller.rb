class SessionsController < ApplicationController
  include SessionsHelper
  def new
    redirect_to "https://adminapps.utep.edu/sso?redirectURL=#{create_session_url}"
  end

  # Create a new session using UTEPSSO
  def create
    user = User.from_sso(cookies[:UTEP_SE], cookies[:UTEP_SA])
    log_in(user) if user
    redirect_to dashboard_index_path
  end

  # Terminate current session and deauthenticate from SSO system
  def destroy
    session.delete(:user_id)
    @current_user = nil
    UTEPSSO.deauthenticate(cookies[:UTEP_SE], cookies[:UTEP_SA])
    redirect_to root_url
  end
end
