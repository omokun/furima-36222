class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]
  before_action :redirect_to_root_path, only: [:index, :create]

  def index
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new
  end

  def create
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new(shipping_address_params)
    if @purchase_record_shipping_address.valid?
      pay_item
      @purchase_record_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end

  def redirect_to_root_path
    redirect_to root_path if current_user == @item.user || @item.purchase_record.present?
  end

  def shipping_address_params
    params.require(:purchase_record_shipping_address).permit(:price, :postal_code, :area_id, :city, :street, :building, :phone, :token).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: shipping_address_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
