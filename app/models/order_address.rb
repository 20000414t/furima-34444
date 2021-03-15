class OrderAddress
  include ActiveModel::Model
  attr_accessor :streetadoress, :postalcade, :cities, :buildname, :order_id, :price, :user_id, :token, :number, :exp_month, :exp_year, :cvc, :prefectures_id, :streetadores, :phonename, :item_id
  # before_action :item_define, only: [:save]

  with_options presence: true do
    validates :user_id
    validates :postalcade, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :token
  end
  def save
  
    order = Order.create(user_id: user_id, item_id: @items_id)
    
    Address.create(postalcade: postalcade, cities: cities, streetadoress: streetadoress, buildname: buildname, order_id: order.id, prefectures_id: prefectures_id)
  end



end
