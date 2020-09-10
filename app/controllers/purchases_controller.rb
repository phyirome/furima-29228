class PurchasesController < ApplicationController
  before_action :move_to_login_page
  before_action :move_to_top_page

  def index
    @item = Item.find(params[:item_id])
    # @item = Purchase.item_id.find(params[:id])
    # binding.pry
  end
  
  def create
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
