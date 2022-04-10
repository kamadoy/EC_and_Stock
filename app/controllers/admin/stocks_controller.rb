class Admin::StocksController < ApplicationController
  def new_store_stock
    @item = Item.find(params[:id])
    @stock = @item.deep_clone(include: [:item_details] ,except: [{ item_details: [:id] }])
    #@item_detail = @stock.item_details.build
    #@size_stock = @item_detail.size_stocks.build
    @genres = Genre.all
    @stores = Store.all
  end
  
  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
    @stores = Store.all
  end

  def delivery
   # @item = Item.find(params[:id])
    #@stock = @item.deep_clone(include: [:item_details])
    #@stock.attributes = item_params #strong parameter
    @stock = Item.new
    @stock.save!
    redirect_to edit_admin_stock_path(@stock)
  end
  
  private
  def item_params
    params.require(:item).permit(:genre_id, :store_id,:name,:image_id,:introduction,:price,:is_active,:created_at,:updated_at ,
                                  item_details_attributes:[:id,:item_id, :color,:image_detail_id, :created_at,:updated_at,:_destroy, 
                                  size_stocks_attributes:[:id,:item_detail_id,:size, :stock,  :created_at,:updated_at,:_destroy]])
  end
end
