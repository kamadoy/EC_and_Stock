class Store::StocksController < ApplicationController
  def index
      @item = Item.find(params[:item_id])
      @item_details = @item.item_details
  end

end
