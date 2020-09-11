class PurchasesController < ApplicationController
  before_action :move_to_login_page
  before_action :move_to_top_page

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(address_params)
    # @item = Purchase.item_id.find(params[:id])
    # binding.pry
  end
  
  def create
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    # binding.pry
    # params.require(:purchase).permit(:postal_code,:city,:building,:address,:phone_number,:prefecture_id).merge(item_id: Item.find(params[:item_id]), user_id: current_user.id )
    params.permit(:postal_code,:city,:building,:address,:phone_number,:prefecture_id, :item_id).merge(user_id: current_user.id)
    # .merge(item_id: Item.find(params[:item_id]), user_id: current_user.id )
  end
  
  def move_to_login_page
    redirect_to new_user_session_path unless user_signed_in?
  end
  
  def move_to_top_page
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
    # @item.purchase != 0
  end

end
