class Public::CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      render ("items/show")
    end
  end
  
  def index
    @cart_items = CartItem.all
    @total_price = 0
  end
  
  def update
  end
  
  def destroy
  end
  
  def destroy_all
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
