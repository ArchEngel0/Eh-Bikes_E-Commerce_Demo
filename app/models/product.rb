class Product < ApplicationRecord
  # attribute :category_id, :integer
  attr_accessor :category_id

  has_many :product_price_histories, dependent: :destroy
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  # accepts_nested_attributes_for :product_categories, allow_destroy: true
end
