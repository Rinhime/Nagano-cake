class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customers = Customer.all
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
end