class Product < ApplicationRecord
  # attribute :category_id, :integer
  attr_accessor :category_id

  has_many :product_price_histories
  has_many :product_categories
  has_many :categories, through: :product_categories
end
