class Store::StockController < ApplicationController
  def index
    @inventories = current_store.inventories.order(size_stock_id: "DESC").order(store_id: "DESC")
  end

  def show
    @item = Item.find(params[:id])
    @item_details = @item.item_details
    #@inventorys = Inventories.where(size_stock_id: @size_stock.id).order(store_id: "DESC")
  end
end
