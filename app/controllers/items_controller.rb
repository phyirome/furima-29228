class ItemsController < ApplicationController
  before_action :move_to_index_if_not_signed_in, except: [:index, :show]
  before_action :set_item, only: [:show, :update]
  before_action :move_to_index_if_item_sold_out, only: [:edit]
  before_action :move_to_index_if_item_is_not_his, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(Item.find(params[:id]))
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      flash.now[:alert] = '削除に失敗しました。'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :text, :image, :category_id, :condition_id, :shipping_day_id, :shipping_fee_id, :shipping_from_id).merge(user_id: current_user.id)
  end

  def move_to_index_if_not_signed_in
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index_if_item_sold_out
    @item = Item.find(params[:id])
    redirect_to root_path unless @item.purchase.nil?
  end

  def move_to_index_if_item_is_not_his
    @item = Item.find(params[:id])
    redirect_to root_path unless @item.user_id == current_user.id
  end
end
