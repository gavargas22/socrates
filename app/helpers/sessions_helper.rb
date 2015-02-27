module SessionsHelper
  require 'savon'

  # Set current user from the current session
  def current_user
    return User.first if Rails.env.development?

    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Initiate a session for the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Check if a session exists and is valid in SSO
  def logged_in?
    return true if Rails.env.development?

    !current_user.nil? && UTEPSSO.authenticated?(cookies[:UTEP_SE], cookies[:UTEP_SA])
  end

  # Terminate current session and clear the current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
