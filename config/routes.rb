Rails.application.routes.draw do
  resources :contact_pages
  resources :categories
  resources :models
  resources :product_price_histories
  resources :products
  resource :about_page, only: [:show, :edit, :update]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "products#index"

  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
end
