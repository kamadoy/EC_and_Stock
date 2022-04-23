class Public::StocksController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_details = @item.item_details
    #@inventorys = Inventories.where(size_stock_id: @size_stock.id).order(store_id: "DESC")
  end
end
