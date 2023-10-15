class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @subtotal = 0
    
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  
  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
    else 
      @cart_item.save
    end
    redirect_to public_cart_items_path
    # @cart_item = CartItem.find(params[:id])
    # @item = @cart_item.items.find(params[:item][:id])
    # @cart_item.create(cart_item_params)
    # redirect_to public_cart_items_path
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
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
