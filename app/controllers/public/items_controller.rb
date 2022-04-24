class Public::ItemsController < ApplicationController

  before_action :search
  def index
   # @items = Item.all
   @items = @q.result(distinct: true)

  end

  def show
    @item = Item.find(params[:id])
    @item_details = @item.item_details.order(:color)
    @cart_item = CartItem.new
  end
  
  def search
    @q = Item.ransack(params[:q])
  end
  
  private
  #def set_q
    #@q = Item.ransack(params[:q])
  #end
end
