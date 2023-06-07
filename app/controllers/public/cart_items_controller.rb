class Public::CartItemsController < ApplicationController
  def create
    @item = Item.find(cart_item_params[:item_id])
  end
  
  def index
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
