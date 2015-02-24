Rails.application.routes.draw do
	resources :staffs

	resources :students

	resources :faculties

	resources :users

	# Sessions
	get    'login'            => 'sessions#new'
	get    'create_session'   => 'sessions#create'
	delete 'logout'           => 'sessions#destroy'

	# resources :courses do
	#   resources :students
	# end

	resources :subjects, shallow: true do
		resources :courses
	end

	resources :courses, shallow: true do
		resources :sections
	end

	resources :sections, shallow: true do
		resources :students
	end


	put 'courses/:id/enroll' => 'courses#enroll', as: 'enroll'

	# The priority is based upon order of creation: first created -> highest priority.
	# See how all your routes lay out with "rake routes".

	# You can have the root of your site routed with "root"
	get 'static_pages/index'
	root 'static_pages#index'

	#Single Sign On Routes
	match '/create_session', to: 'sessions#create', as: 'create_session', via: [:get, :post]
	match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

	#Quizzes and Survey System
	mount Rapidfire::Engine => "/questions"
end
