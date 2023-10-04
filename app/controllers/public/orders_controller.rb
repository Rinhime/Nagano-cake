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
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @shipping_cost = 800
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to public_orders_finish_path
    
    current_customer.cart_items.each do |cart_item|
      @order_item = OrderItems.new
      @order_item.order_id =  @order.id
      @order_item.item_id = cart_item.item_id
      @order_item.amounts = cart_item.amounts
      @order_item.tax_price = (cart_item.item.price*1.1).floor
      @order_item.save
    end
      current_member.cart_items.destroy_all #カートの中身を削除
      redirect_to thanx_orders_path
  end

  def finish
  end

  private

    def order_params
      params.require(:order).permit(:payment_method, :shipping_cost, :payment_price, :postal_code, :address, :name, :customer_id)
    end

end