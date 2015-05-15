Rails.application.routes.draw do

	# The priority is based upon order of creation: first created -> highest priority.
	# See how all your routes lay out with "rake routes".

	# mount RailsAdmin::Engine => '/teacher', as: 'rails_admin'

	resources :subjects

	resources :staffs

	resources :students

	resources :faculties

	resources :users

	resources :courses

	resources :sections

	resources :subscriptions, only: [:create, :destroy]

	# get 'sections/:id/courses/:id' => 'courses#show', as: 'section_course'

	# resources :subjects, shallow: true do
	# 	resources :courses
	# end
	#
	# resources :courses, shallow: true do
	# 	resources :sections
	# end
	#
	# resources :sections, shallow: true do
	# 	resources :students
	# end

	# ----------------------Routes for course subscription --------------------------
	put 'courses/:id/enroll' => 'courses#enroll', as: 'enroll'
	get 'courses/:id/exit' => 'subscriptions#destroy', as: 'leave_course'

	# --------------------------------------------------------------------------------


	# --------------------------- Routes for the static pages -------------------------

	root 'static_pages#index'

	# ---------------------------------------------------------------------------------

	# ------------------------------Dashboard Routes-----------------------------------
	resources :dashboard, only: [:index]
	get 'dashboard/home' => 'dashboard#home'
	get 'dashboard/courses' => 'dashboard#courses'
	# ---------------------------------------------------------------------------------

	#Single Sign On Routes
	match 'login', to: 'sessions#new', as: 'login', via: [:get, :post]
	match '/create_session', to: 'sessions#create', as: 'create_session', via: [:get, :post]
	match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

	#--------------------------------Survey Plugin & System--------------------------------
	scope module: 'contests' do
		resources :surveys
		resources :attempts
	end

	match '/surveys/new', to: 'contests/surveys#new', as: 'new_question', via: [:get, :post]
	get '/surveys/', to: 'contests/surveys#show', as: 'contests_surveys', via: [:get, :post]
	get '/surveys/:id', to: 'contests/surveys#show', as: 'show_survey', via: [:get, :post]

	# ------------------------------------------------------------------------------------------

end
