Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :owner_profiles, only: [ :new, :create, :show, :edit, :update, :index]

  resources :jobs, only: [ :new, :create, :show, :edit, :update, :index] do
    resources :worker_profiles, only: [ :index ]
  end

  match 'create_new_owner_profile', to: 'owner_profiles#create', via: :get

  match 'worker_jobs', to: 'jobs#my_worker_jobs', via: :get

  match 'store_worker_id', to: 'worker_profiles#store_worker_id', via: :post

  namespace :dashboard do
    get 'owners', to: "dashboards#owner"
    get 'workers', to: "dashboards#worker"
  end

  resources :worker_profiles, only: [ :new, :create, :show, :edit, :update, :index] do
    resources :jobs, only: [ ] do
     resources :requests, only: [ :new, :create, :index, :show]
    end
  end


  resources :requests, only: [ :edit, :create, :update ]

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

end
