class OrdersController < ApplicationController
before_action :item_define, only: [:create]
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
        # priceは@itemから取得する
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

end

