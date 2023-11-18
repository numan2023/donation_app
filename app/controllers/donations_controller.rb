class DonationsController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
  end

  # new,createアクションで、Formオブジェクトのインスタンスを生成
    # Formオブジェクトのインスタンスをform_withのmodelオプションに指定
    # createアクション生成のインスタンスと前述のform_withのmodelオプションでエラーメッセージをフォームに表示
  def new
    @donation_address = DonationAddress.new
  end

  def create
    @donation_address = DonationAddress.new(donation_params)
    if @donation_address.valid? # DonatoinAddressクラスがApplicationRecordを継承していないことで、saveメソッドにバリデーションを実行する機能がないため。
      @donation_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def donation_params
    params.require(:donation_address).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :price).merge(user_id: current_user.id)
  end

  # def address_params
  #   params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(donation_id: @donation.id)
  # end
end
