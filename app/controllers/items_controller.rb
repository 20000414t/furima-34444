class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @items = Item.new
  end
  
  def create
    @items = Item.new(items_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @items = Item.find(params[:id])
  end

  private
  def items_params
    params.require(:item).permit(:name, :price, :item_status_id, :prefecture_id, :delivary_date_id, :delivary_price_id,:image, :category_id, :info, :id).merge(user_id: current_user.id)
  end


  


end
