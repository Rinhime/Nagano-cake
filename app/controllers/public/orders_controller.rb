class Public::OrdersController < ApplicationController
  def new
  end
  
  def confirm
    @cart_items = CartItem.where(customer_id.current_id)
    @shipping_cost = 800
    @payment_method = params[:order][:pey_method]
    
    ary = []
    @cart_items.each do |cart_item|
      ary << cart_item.item.price*cart_item.amount
    end
    
    @cart_items_price = ary.sum
    
    
  end
  
  def index
  end
  
  def show
  end
  
  def create
  end
  
  def finish
  end
  
  
end
