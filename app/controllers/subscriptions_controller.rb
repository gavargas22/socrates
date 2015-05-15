class SubscriptionsController < ApplicationController

  # Subscribe current user to the given event
  def create
    course = Course.friendly.find(params[:course_id])
    current_user.subscribe(course)
    redirect_to course
  end

  # Unsubscribe current_user from the given event
  def destroy
    course = Course.find(params[:id]).course
    current_user.unsubscribe(course)
    redirect_to course
  end
end
