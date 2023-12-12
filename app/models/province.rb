class Province < ApplicationRecord
  has_many :user_provinces, dependent: :destroy
  has_many :users, through: :user_provinces

  validates :name, presence: true
  validates :gst, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :hst, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :pst, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
