class Store::ItemsController < ApplicationController
     before_action :authenticate_store!
  def index
   @items = Item.where(is_active: true)
   @stop_items = Item.where(is_active: false)
  end

  def show
  @item = Item.find(params[:id])
  @item_details = @item.item_details
  end
end
