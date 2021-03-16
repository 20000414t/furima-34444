class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
before_action :item_define, only: [:create]
before_action :move_to_index, only: [:index]

  def index
    @items = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    
      if @order_address.valid?
        pay_item
        @order_address.save
       redirect_to root_path
      else
        render 'index'
      end
  end

  private
  
  def order_params
    params.require(:order_address).permit(:streetadoress, :postalcade, :cities, :buildname, :prefectures_id, :phonename).merge(user_id: current_user.id,  token: params[:token], item_id: @items.id)
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY" ]
    
    Payjp::Charge.create(
      :amount => @items.price,  
      card: order_params[:token],    
      currency: 'jpy'                
    )
  end

  def item_define
    @items = Item.find(params[:item_id])
  end

   def move_to_index
    @items = Item.find(params[:item_id])
   if user_id = @items.user_id
       redirect_to root_path
     end
  end
end

