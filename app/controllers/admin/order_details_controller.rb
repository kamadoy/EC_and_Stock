class Admin::OrderDetailsController < ApplicationController
   before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update!(order_params)
    redirect_to admin_order_detail_path(@order)
  end



   private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name,:customer_id,:shipping_cost,:select_address,:address_id,:total_payment,:status,:created_at,:updated_at,:address_id,
                                  order_details_attributes:[:id,:item_id, :order_id, :price, :amount,:created_at,:updated_at])
  end
end
