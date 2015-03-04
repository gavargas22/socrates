class DashboardController < ApplicationController

  def home
  end

  def courses
    return 1
  end

  @courses = Course.all
end
