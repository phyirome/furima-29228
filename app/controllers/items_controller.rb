class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  private

  def item_params
    params.require(:image).permit(:name, :price, :text, :image)
  end
end
