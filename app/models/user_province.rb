class UserProvince < ApplicationRecord
  belongs_to :user
  belongs_to :province

  validates :user_id, presence: true
  validates :province_id, presence: true
end
