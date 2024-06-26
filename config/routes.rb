Rails.application.routes.draw do
  get 'health/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/health", to: "health#show"
  root "authors#index"

  resources :books
  resources :publishers
  resources :authors
  resources :genres

  namespace :api do
    namespace :v1 do
      resources :authors
    end
    get "unauthorized", to: "api_base#unauthorized", as: :api_unauthorized
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
