class Admin::StoresController < ApplicationController
  def new
    @store = Store.new
  end

  def create
      @store = Store.new(store_params)
    if @store.save

    redirect_to admin_store_path(@store)
    else
    render :new
    end
  end

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
     if@store.update(store_params)
     redirect_to admin_store_path(@store)
     else
     render :edit
     end

  end

private

  def store_params
    params.require(:store).permit(:name,:email,:address,:encrypted_password,:created_at,:updated_at)
  end
end
