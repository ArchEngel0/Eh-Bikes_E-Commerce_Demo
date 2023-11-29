class UserProvince < ApplicationRecord
  belongs_to :user
  belongs_to :province
end
