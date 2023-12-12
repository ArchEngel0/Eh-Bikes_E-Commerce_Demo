class Product < ApplicationRecord
  # attribute :category_id, :integer
  attr_accessor :category_id

  has_many :product_price_histories, dependent: :destroy
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  # accepts_nested_attributes_for :product_categories, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :sale, inclusion: { in: [true, false] }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
