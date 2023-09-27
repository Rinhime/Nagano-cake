class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    
  end
  
  def confirm
    @order = Order.new(order_params)
    
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
      params.require(:order).permit(:shipping_cost, :payment_method, :payment_price, :address, :postal_code, :name)
    end
  
end