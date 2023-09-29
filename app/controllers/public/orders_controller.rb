class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @postal_code = current_customer.postal_code
    @address = current_customer.address
    @last_name = current_customer.last_name
    @first_name = current_customer.first_name
    @customer = current_customer
  end
  
  def confirm
    @order = Order.new(order_params)
    @order.post_code = current_customer.post_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
  end
  
  def index
  end
  
  def show
  end
  
  def create
    @order = Order.new
    @order.save(order_params)
    redirect_to public_orders_confirm_path
  end
  
  def finish
  end
  
  private
  
    def order_params
      params.require(:order).permit(:payment_method, :shipping_cost, :payment_price, :postal_code, :address, :name)
    end
  
end