class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price  }
    @order = Order.new(order_params)
    @order.shipping_cost = 800

    if @order.select_address == '0'
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    elsif @order.select_address == '1'
        @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
    else
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

   @cart_items = current_customer.cart_items
   @cart_items.each do |cart_item|
     @size_stock = cart_item.size_stock
     @size_stock.stock -= cart_item.amount
     @size_stock.save
     @order_detail = OrderDetail.new
     @order_detail.order_id = @order.id
     @order_detail.size_stock_id = cart_item.size_stock_id
     @order_detail.price = cart_item.item_order.price
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
    params.require(:order).permit(:payment_method, :postal_code, :address, :name,:customer_id,:shipping_cost,:select_address,:address_id,:total_payment,:status,:created_at,:update_at,:address_id)
  end

end
