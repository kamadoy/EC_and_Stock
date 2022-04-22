class Admin::StocksController < ApplicationController
 
 def new
    @form = Form::InventoryCollection.new
    @item = Item.find(params[:item_id])
    @item_details = @item.item_details
 end
  
  def create
    #@inventory = Inventory.new(inventory_params)
     @form = Form::InventoryCollection.new(inventory_collection_params)
     @item = Item.find(params[:item_id])
     @item_details = @item.item_details
     
    if @form.save
      #Inventory.find_by(size_stock_id: params[:inventory][:size_stock_id],store_id: params[:inventory][:store_id])
        #@size_stock = @inventory.size_stock
        #@size_stock.stock -= @inventory.quantity
       # @size_stock.save
       #@inventory = Inventory.find_by(size_stock_id: params[:inventory][:size_stock_id],store_id: params[:inventory][:store_id])
       

       # @inventory.quantity += params[:inventory][:quantity].to_i
       # @inventory.save
        
    
          redirect_to admin_item_stocks_path(@item)
    #elsif @inventory.save
         # @size_stock = @inventory.size_stock
          #@size_stock.stock -= @inventory.quantity
          #@size_stock.save
      #redirect_to admin_stocks_path
    else
     render :new
    end

  end
  
  def show
    @item = Item.find(params[:id])
    @item_details = @item.item_details
    #@inventory
    #@inventorys = Inventories.where(size_stock_id: @size_stock.id).order(store_id: "DESC")
  end

  def index
    @inventorys = Inventory.all.order(size_stock_id: "DESC").order(store_id: "DESC")
  end
  
  private

    def inventory_params
      params.require(:inventory).permit(:store_id,:size_stock_id,:quantity,:created_at,:updated_at)
    end
    
    def inventory_collection_params
      params.require(:form_inventory_collection).permit(inventories_attributes: [:store_id,:size_stock_id,:quantity,:created_at,:updated_at,:availability])
    end
end
