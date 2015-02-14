class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  # def current_user
  #   if(UTEPSSO.authenticated(cookies[:UTEP_SE]), cookies[:UTEP_SA])
  #     User.from_sso(cookies[:UTEP_SE], cookies[:UTEP_SA])
  #   end
  # end
end
