class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end
  
  def create
    @items = Item.new(items_params)
    if @items.save
      redirect_to root_path
    else
      render :root_path
    end
  end

  private
  def items_params
    params.require(:item).permit(:name, :price, :item_status_id, :prefectures_id, :day_time_id, :delivary_price_id,:image, :category_id, :prefectures_id, :info).merge(user_id: current_user.id)
  end
end
