class Admin::ItemsController < ApplicationController
 def new
 @item = Item.new
    @item_detail = @item.item_details.build 
    @size_stock = @item_detail.size_stocks.build
    @genres = Genre.all
 end

def create
 @item = Item.new(recipe_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render :new
    end
end

def show
@item = Item.find
@item_details = @item.item_details.build
@size_stocks = @item_detail.size_stocks.build

end

  def edit
  end

  def index
  end
  
  private

  def recipe_params
    params.require(:item).permit(:genre_id, :name,:image_id,:introduction,:price,:is_active,:created_at,:updated_at ,
                                  image_details_attributes:[:item_id, :color, :created_at,:updated_at,:_destroy ], 
                                  size_stocks_attributes:[:item_detail_id,:size, :stock,  :created_at,:updated_at,:_destroy])
  end

end
