class Store::StocksController < ApplicationController
  before_action :authenticate_store!
  def index
      @item = Item.find(params[:item_id])
      @item_details = @item.item_details
  end

end
