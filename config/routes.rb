Rails.application.routes.draw do
  get 'cart/show'
  resources :contact_pages
  resources :categories
  resources :models
  resources :product_price_histories
  resources :products
  resource :about_page, only: [:show, :edit, :update]
  devise_for :users
  resources :users do
    resources :orders, only: [:create, :index]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "products#index"

  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  post '/cart/add/:product_id', to: 'cart#add', as: 'add_to_cart'
  get '/cart', to: 'cart#show', as: 'cart'

  post '/cart/decrease/:product_id', to: 'cart#decrease_quantity', as: 'decrease_quantity'
  post '/cart/increase/:product_id', to: 'cart#increase_quantity', as: 'increase_quantity'
  delete '/cart/remove/:product_id', to: 'cart#remove', as: 'remove_from_cart'

  get 'checkout/index'
  get '/all_users', to: 'all_users#index', as: 'all_users'
end
