Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :worker_profiles, only: [ :new, :create, :show, :edit, :update, :index]
  resources :owner_profiles, only: [ :new, :create, :show, :edit, :update, :index]
  resources :jobs, only: [ :new, :create, :show, :edit, :update, :index]


end
