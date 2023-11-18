class Address < ApplicationRecord
  belongs_to :donation

  # numericality : 指定されたカラムに対して数値かどうかを検証するヘルパー
  # 数字3桁、ハイフン、数字4桁の並びのみ許可する
  # formオブジェクトにより不要：validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # 0以外の整数を許可する
  # formオブジェクトにより不要：validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
end
