class Donation < ApplicationRecord
  belongs_to :user
  has_one :address

  # 1以上、1,000,000以下の整数を許可する
  # formオブジェクトにより不要：validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1,000,000, message: "is invalid"}
end
