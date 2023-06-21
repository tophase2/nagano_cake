class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @orders = Order.page(params[:page])
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end
end
