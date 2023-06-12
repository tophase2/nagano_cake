class Public::CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if Item.find_by(name: @cart_item.item)
      @cart_item.amount += params[:amount].to_i
    else
      CartItem.new(cart_item_params)
    end
    if @cart_item.save
      redirect_to cart_items_path
    else
      render ("items/show")
    end
  end
  
  def index
    @cart_items = current_customer.cart_items
    @total_price = 0
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:amount].to_i)
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
