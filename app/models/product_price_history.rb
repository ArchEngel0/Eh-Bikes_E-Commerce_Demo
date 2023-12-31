class ProductPriceHistory < ApplicationRecord
  belongs_to :product
  validates :product_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
