class Admin::StocksController < ApplicationController
  def new_store_stock
    @item = Item.find(params[:id])
    @store_item = @item.deep_clone(include: [:item_details,{item_details: :size_stocks}] )
    @stores = Store.all
  end
  
  def show
    @store_item = StoreItem.find(params[:id])
    @store_item_details = @store_item.store_item_details
  end
  
  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
    @stores = Store.all
  end

  def delivery
    @item = Item.new
    @store_item = @item.deep_clone(include: [:item_details,{item_details: :size_stocks}] )
    #@store_item = @item.deep_clone(include: [:item_details])
    #@store_item.attributes = item_params #strong parameter
    #@item = Item.find(params[:id])
    #@store_item = @item.deep_clone(include: [:item_details,{item_details: :size_stocks}] ,except: [{ item_details: [:id] }])
    #@stores = Store.all
    @store_item = StoreItem.new
    @store_item.item_id = @item.id
    @store_item.name = @item.name
    @store_item.genre_id = @item.genre_id
    @store_item.price = @item.price
    @store_item.is_active = @item.is_active
    @store_item.store_id = @item.store_id
    @item_details = @item.item_details
    @item_details.each do |item_detail|
      @store_item_detail.color = item_detail.color
      @store_item_detail.store_item_id = @store_item.id
      @size_stocks = item_detail.size_stocks
      @size_stocks.each do |size_stock|
        @store_stock.store_item_detail_id = size_stock.id
        @store_stock.size = size_stock.size
        @store_stock.stock = size_stock.stock
      end
    end
    
    @store_item.save!
    redirect_to admin_stock_path(@store_item)
  end
  
  private
  def item_params
    params.require(:item).permit(:genre_id, :store_id,:name,:image_id,:introduction,:price,:is_active,:created_at,:updated_at ,
                                  item_details_attributes:[:id,:item_id, :color,:image_detail_id, :created_at,:updated_at,:_destroy, 
                                  size_stocks_attributes:[:id,:item_detail_id,:size, :stock,  :created_at,:updated_at,:_destroy]])
  end
end
