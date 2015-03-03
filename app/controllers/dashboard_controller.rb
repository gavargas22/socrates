class DashboardController < ApplicationController

  def home
  end
  @courses = Course.all
end
