class Model < ApplicationRecord
  validates :Category, presence: true
  validates :name, presence: true
end
