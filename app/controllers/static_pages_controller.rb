class StaticPagesController < ApplicationController
	include SessionsHelper

	before_action :check_login

	def index
	end

	def check_login
		redirect_to dashboard_index_path if logged_in?
	end
end
