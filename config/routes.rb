Rails.application.routes.draw do

	mount RailsAdmin::Engine => '/teacher', as: 'rails_admin'

	resources :subjects

	resources :staffs

	resources :students

	resources :faculties

	resources :users
	
	resources :subjects

	resources :courses

	resources :sections

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


	put 'courses/:id/enroll' => 'courses#enroll', as: 'enroll'

	# The priority is based upon order of creation: first created -> highest priority.
	# See how all your routes lay out with "rake routes".

	# You can have the root of your site routed with "root"
	root 'static_pages#index'

	# Dashboard Routes
	resources :dashboard, shallow: true do
		# resources :courses
		resource :users
	end

	get 'dashboard/home' => 'dashboard#home'
	get 'dashboard/courses'

	# Dashboard for Teachers
	get 'teacher/' => 'teacher#home'

	#Single Sign On Routes
	match 'login', to: 'sessions#new', as: 'login', via: [:get, :post]
	match '/create_session', to: 'sessions#create', as: 'create_session', via: [:get, :post]
	match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
