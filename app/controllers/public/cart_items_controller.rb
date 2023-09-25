class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @subtotal = 0
    @cart_item = CartItem.new
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to public_cart_items_path
    # @cart_item = CartItem.find(params[:id])
    # @item = @cart_item.items.find(params[:item][:id])
    # @cart_item.create(cart_item_params)
    # redirect_to public_cart_items_path
  end
  
  def update
  end
  
  def destroy
  end
  
  def destroy_all
  end
  
  private
 
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
