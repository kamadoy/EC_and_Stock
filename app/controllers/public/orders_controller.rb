class Public::OrdersController < ApplicationController
def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price  }
    @order = Order.new(order_params)
    @order.shipping_cost = 800

    if @order.select_adress == '0'
    @order.postal_code = current_customer.postal_code
    @order.adress = current_customer.adress
    @order.name = current_customer.first_name + current_customer.last_name
    elsif @order.select_adress == '1'
        @adress = Adress.find(params[:order][:adress_id])
        @order.postal_code = @adress.postal_code
        @order.adress = @adress.adress
        @order.name = @adress.name
    else
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

   @cart_items = current_customer.cart_items
   @cart_items.each do |cart_item|
     @order_detail = OrderDetail.new
     @order_detail.order_id = @order.id
     @order_detail.item_id = cart_item.item_id
     @order_detail.price = cart_item.item.price
     @order_detail.amount = cart_item.amount
     @order_detail.save
   end
   @cart_items.destroy_all
  redirect_to thanks_path
  end

  def thanks
  end

  def index
  # @order_details = current_customer_id.order.order_details
   @orders = current_customer.orders
   # @order_details.order_id.customer_id = current_customer
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :adress, :name,:customer_id,:shipping_cost,:select_adress,:adress_id,:total_payment,:status,:created_at,:update_at,:adress_id)
  end
end
