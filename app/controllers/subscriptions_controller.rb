class SubscriptionsController < ApplicationController
	include SessionsHelper

	# Subscribe current user to the given event NOT USED IN ITS CURRENT STATE
	def create
		course = Course.friendly.find(params[:course_id])
		current_user.subscribe(course)
		redirect_to course
	end

	# Unsubscribe current_user from the given event
	def destroy
		# course = Course.friendly.find(params[:id]).course
		course = Course.friendly.find(params[:id])
		current_user.unsubscribe(course)
		redirect_to courses_path
	end
end
