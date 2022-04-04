class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @item_details = @item.item_details
    @cart_item = CartItem.new
  end
end
