class Product < ApplicationRecord
  has_many :product_price_histories
  has_many :categories, through: :product_categories
end
