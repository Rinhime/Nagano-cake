class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @subtotal = 0
    @cart_item = CartItem.new
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  
  def create
    @cart_item = CartItem.find_by(cart_item_params)
    if @cart_item
      @cart_item.amount += CartItem.new(cart_item_params).amount
    else
      @cart_item = CartItem.new(cart_item_params)
    end
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to public_cart_items_path
    # @cart_item = CartItem.find(params[:id])
    # @item = @cart_item.items.find(params[:item][:id])
    # @cart_item.create(cart_item_params)
    # redirect_to public_cart_items_path
  end
  
  def update
    @cart_item = current_customer
    
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end
  
  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to public_cart_items_path, notice: 'カートが空になりました。'
  end
  
  private
 
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
