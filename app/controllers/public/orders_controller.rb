class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_customer.address
    @postal_code = current_customer.postal_code
  end
  
  def confirm
  end
  
  def index
  end
  
  def show
  end
  
  def create
  end
  
  def finish
  end
  
  private
  
    def order_params
      params.require(:order).permit(:shipping_cost, :payment_method, :payment_price, :address, :postal_code, :name)
    end
  
end