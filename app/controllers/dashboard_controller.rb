class DashboardController < ApplicationController

  def home
    @courses = Course.all
  end

  def courses
    @courses = Course.all
  end

  def show
    @courses = Course.all
  end

end
