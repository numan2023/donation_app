class DonationAddress
  # 手順２
  include ActiveModel::Model
  # 手順３
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :price, :user_id
  # -> 手順２、３でFormオブジェクトの属性をform_withの引数に指定できる

  # 手順４
  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :user_id # donation_addressクラスにアソシエーションを定義することができないため、user_idに対してバリデーションを設定
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  # 手順６
  def save
    # 寄付情報を保存し、変数donationに代入する
    donation = Donation.create(price: price, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, donation_id: donation.id)
  end
end