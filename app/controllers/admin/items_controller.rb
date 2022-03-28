class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.item_details.build
    #item_detail = @item.item_details
    #item_detail.materials.build
    @genres = Genre.all
  end
  
  def choice
    @item = Item.new
    @item.item_details.build
    #item_detail = @item.item_details
    #item_detail.materials.build
  end

  def create
    @item =Item.new(item_params)
    if@item.save
    redirect_to admin_item_path(@item)
    else
    @genres = Genre.all
    render :new
    end
  end

  def show
  end

  def edit
  end

  def index
  end
end
