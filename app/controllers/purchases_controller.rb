class PurchasesController < ApplicationController
  before_action :move_to_login_page
  before_action :move_to_top_page_if_item_is_his
  before_action :move_to_top_page_if_item_sold_out

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
    # @item = Purchase.item_id.find(params[:id])
  end
  
  def create
    # @purchase = Purchase.new(purchase_params)
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.valid?
      pay_item
      # @purchase.save
      @purchase_address.save
      # binding.pry
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    # binding.pry
    # params.require(:purchase).permit(:postal_code,:city,:building,:address,:phone_number,:prefecture_id).merge(item_id: Item.find(params[:item_id]), user_id: current_user.id )
    params.permit(:postal_code,:city,:building,:address,:phone_number,:prefecture_id, :item_id, :token).merge(user_id: current_user.id)
    # .merge(item_id: Item.find(params[:item_id]), user_id: current_user.id )
  end
  
  def move_to_login_page
    redirect_to new_user_session_path unless user_signed_in?
  end
  
  def move_to_top_page_if_item_is_his
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
    # @item.purchase != 0
  end
  
  def move_to_top_page_if_item_sold_out
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.purchase != nil
  end
  
  def purchase_params
    params.permit(:token)
  end

  def pay_item
    # binding.pry
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
