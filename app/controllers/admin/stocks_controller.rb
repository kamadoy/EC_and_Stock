class Admin::StocksController < ApplicationController
  def new
     @inventory = inventory.new(inventory_params)
  end
  
  def create
    @inventory = Inventory.new(inventory_params)
    
    if  Inventory.find_by(size_stock_id: params[:inventory][:size_stock_id],store_id: params[:inventory][:store_id])
        @size_stock = @inventory.size_stock
        @size_stock.stock -= @inventory.quantity
        @size_stock.save
       @inventory = Inventory.find_by(size_stock_id: params[:inventory][:size_stock_id],store_id: params[:inventory][:store_id])
       
    #   redirect_to action: :update id: (params[:cart_item][:size_stock_id])
        @inventory.quantity += params[:inventory][:quantity].to_i
        @inventory.save
        
    
          redirect_to admin_stocks_path
    elsif @inventory.save
          @size_stock = @inventory.size_stock
          @size_stock.stock -= @inventory.quantity
          @size_stock.save
      redirect_to admin_stocks_path
    else
     redirect_to admin_items_path
    end

  end


  def index
    @inventorys = Inventory.all.order(size_stock_id: "DESC").order(store_id: "DESC")
  end
  
  private

    def inventory_params
      params.require(:inventory).permit(:store_id,:size_stock_id,:quantity,:created_at,:updated_at)
    end
end
