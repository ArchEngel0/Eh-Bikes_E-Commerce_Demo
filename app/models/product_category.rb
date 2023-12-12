class ProductCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category
  validates :product_id, presence: true
  validates :category_id, presence: true

  # has_many :categories
  # has_many :products
end
