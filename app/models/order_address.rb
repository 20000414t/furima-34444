class OrderAddress
  include ActiveModel::Model
  attr_accessor :streetadoress, :postalcade, :cities, :buildname, :user_id, :token, :prefectures_id, :streetadores, :phonename, :item_id
  

  with_options presence: true do
    validates :user_id
    validates :postalcade, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :token
    validates :prefectures_id,
    numericality: {other_than: 0}
    validates :cities
    validates :streetadoress
    validates :phonename
  end
  def save
  
    order = Order.create(user_id: user_id, item_id: item_id)
    
    Address.create(postalcade: postalcade, cities: cities, streetadoress: streetadoress, buildname: buildname, order_id: order.id, prefectures_id: prefectures_id, phonename: phonename)
  end



end
