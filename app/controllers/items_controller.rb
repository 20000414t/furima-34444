class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :itemsnoteigi, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]
  before_action :move_to_sign, except: [:index, :show]
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

  def edit
    @items = Item.find(params[:id])
  end

  def update
    @items = Item.find(params[:id])
    @items.update(items_params)
    if @items.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def items_params
    params.require(:item).permit(:name, :price, :item_status_id, :prefecture_id, :delivary_date_id, :delivary_price_id,:image, :category_id, :info, :id).merge(user_id: current_user.id)
  end

  def itemsnoteigi
    @items = Item.find(params[:id])
  end

  
  def move_to_sign
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def move_to_index
      unless current_user.id == @items.user_id
      redirect_to root_path
      end
  end

end
