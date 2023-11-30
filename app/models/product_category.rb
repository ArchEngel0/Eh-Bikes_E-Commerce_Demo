class ProductCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category

  # has_many :categories
  # has_many :products
end
