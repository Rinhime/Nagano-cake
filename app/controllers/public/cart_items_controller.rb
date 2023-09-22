class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    
  end
  
  def create
    @cart_item = CartItem.find(params[:item_id])
    @item = @cart_item.items.find(params[:item][:id])
    @cart_item.create(cart_item_params)
    redirect_to public_cart_items_path
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
