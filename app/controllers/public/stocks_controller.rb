class Public::StocksController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @item_details = @item.item_details
    #@inventorys = Inventories.where(size_stock_id: @size_stock.id).order(store_id: "DESC")
  end
end
