class Province < ApplicationRecord
  has_many :user_provinces, dependent: :destroy
  has_many :users, through: :user_provinces
end
