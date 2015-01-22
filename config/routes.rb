Rails.application.routes.draw do
  resources :staffs

  resources :students

  resources :faculties

  resources :users

  resources :courses

  resources :sections

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  get 'static_pages/index'
  root 'static_pages#index'

  #Single Sign On Routes
  match '/create_session', to: 'sessions#create', as: 'create_session', via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
