class Admin::OrderDetailController < ApplicationController
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
    params.require(:order).permit(:payment_method, :postal_code, :adress, :name,:customer_id,:shipping_cost,:select_adress,:adress_id,:total_payment,:status,:created_at,:update_at,:adress_id,
                                  order_details_attributes:[:id,:item_id, :order_id, :price, :amount,:created_at,:update_at])
  end
end
