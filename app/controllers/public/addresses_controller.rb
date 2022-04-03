class Public::AddressesController < ApplicationController
  def index
    @adress = Adress.new
    @adresses = current_customer.adresses
  end

  def edit
    @adress = Adress.find(params[:id])
  end

  def update
     @adress = Adress.find(params[:id])
     if@adress.update(adress_params)
     redirect_to adresses_path
     else
      render :edit
     end
  end

  def create
    @adress = Adress.new(adress_params)
    @adress.customer = current_customer
    if@adress.save
    redirect_to adresses_path
    else
      @adresses = current_customer.adresses
      render :index
    end
  end

  def destroy
   @adress = Adress.find(params[:id])
   @adress.destroy
   redirect_to adresses_path
  end

   private

  def adress_params
    params.require(:adress).permit(:customer_id, :name,:postal_code,:adress,:create_at,:update_at)
  end
end
