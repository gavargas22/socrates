class DashboardController < ApplicationController
  include SessionsHelper
  before_action :check_login

  def home
    @courses = Course.all
  end

  def courses
    @courses = Course.all
    render
  end

  def show
    @courses = Course.all
  end

  #Functions for checking if log in is correct.

  private
  def check_login
    redirect_to root_path if logged_in? == false
  end

end
