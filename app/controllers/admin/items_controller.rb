class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品の新規登録が完了しました。"
      redirect_to admin_items_path
    else
      flash[:alert] = "商品の新規登録内容に不備があります。"
      render :new
    end
  end
  
  def index
    @items = Item.page(params[:page])
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price)
  end
end
