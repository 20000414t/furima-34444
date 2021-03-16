class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  
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
  end

  def edit
  end

  def update
    @items.update(items_params)
    if @items.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if@items.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def items_params
    params.require(:item).permit(:name, :price, :item_status_id, :prefecture_id, :delivary_date_id, :delivary_price_id,:image, :category_id, :info, :id).merge(user_id: current_user.id)
  end

   def set_item
    @items = Item.find(params[:id])
   end

   def move_to_index
      unless current_user.id == @items.user_id
        redirect_to root_path
      end
   end

end
