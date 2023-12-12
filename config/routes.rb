# This file defines the routes for the Eh-Bikes E-Commerce Demo application.
# It specifies the URLs and corresponding controller actions for various pages and resources.
# The routes are defined using the Ruby on Rails DSL (Domain-Specific Language).
# For more information on routing in Ruby on Rails, refer to the official documentation: https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  # Route for showing the cart
  get 'cart/show'

  # Resource routes for contact pages, categories, models, product price histories, and products
  resources :contact_pages
  resources :categories
  resources :models
  resources :product_price_histories
  resources :products

  # Singular resource route for the about page, allowing only specific actions
  resource :about_page, only: [:show, :edit, :update]

  # Devise routes for user authentication
  devise_for :users

  # Nested resource route for users and their orders
  resources :users do
    resources :orders, only: [:create, :index]
  end

  # Resource route for tax rates, allowing only specific actions
  resources :tax_rates, only: [:index, :edit, :update]

  # Route for health status check
  get "up" => "rails/health#show", as: :rails_health_check

  # Root path route
  root to: "products#index"

  # Custom routes for about and contact pages
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'

  # Route for adding a product to the cart
  post '/cart/add/:product_id', to: 'cart#add', as: 'add_to_cart'

  # Route for showing the cart
  get '/cart', to: 'cart#show', as: 'cart'

  # Routes for decreasing and increasing the quantity of a product in the cart
  post '/cart/decrease/:product_id', to: 'cart#decrease_quantity', as: 'decrease_quantity'
  post '/cart/increase/:product_id', to: 'cart#increase_quantity', as: 'increase_quantity'

  # Route for removing a product from the cart
  delete '/cart/remove/:product_id', to: 'cart#remove', as: 'remove_from_cart'

  # Route for the checkout index page
  get 'checkout/index'

  # Route for displaying all users
  get '/all_users', to: 'all_users#index', as: 'all_users'
end
