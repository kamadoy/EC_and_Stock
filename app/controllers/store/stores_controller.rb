class Store::StoresController < ApplicationController
  before_action :authenticate_store!
  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
  end

  def edit
     @store = Store.find(params[:id])
    if @store != current_store
       redirect_to store_store_path(current_store)
    else
      render :edit
    end
  end
  
  def update
     @store = Store.find(params[:id])
     
     if@store.update(store_params)
     redirect_to store_store_path(@store)
     else
     render :edit
     end
  end
  private

  def store_params
    params.require(:store).permit(:name,:email,:address,:encrypted_password,:created_at,:updated_at)
  end
end
