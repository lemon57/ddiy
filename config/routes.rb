Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :owner_profiles, only: [ :new, :create, :show, :edit, :update, :index]
  match 'create_new_owner_profile', to: 'owner_profiles#create', via: :get

  resources :jobs, only: [ :new, :create, :show, :edit, :update, :index]

  match 'owner_jobs', to: 'jobs#my_owner_jobs', via: :get
  match 'worker_jobs', to: 'jobs#my_worker_jobs', via: :get

  namespace :dashboard do
    get 'owners', to: "dashboards#owner"
    get 'workers', to: "dashboards#worker"
  end

  resources :worker_profiles, only: [ :new, :create, :show, :edit, :update, :index] do
    resources :requests, only: [ :new, :create, :index, :show]
  end
  resources :requests, only: [ :edit, :update ]
end
