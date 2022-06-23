class User < ApplicationRecord
  belongs_to :library
  has_one :user_datum, dependent: :destroy
  validates :index, presence: true, uniqueness: true, length: { in: 3..50 }
  validates :password, presence: true, length: { minimum: 6 }
  has_many :orders, dependent: :destroy
  has_secure_password
  has_secure_token
end
