class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy

  has_one :user_province, dependent: :destroy
  has_one :province, through: :user_province

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validates :name, presence: true
  validates :address_line_one, presence: true
  validates :admin, inclusion: { in: [true, false] }
  validates :province_id, presence: true
end
