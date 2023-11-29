Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :articles
  get 'signup', to: "users#new"
  resources :users, except: [:new]


  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
