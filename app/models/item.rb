class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  #has_one :buy

  with_options presence: true do
    validates :name
    validates :image
    validates :info
  end
    with_options numericality: {other_than: 0} do
      validates :category_id
    
      validates :item_status_id
      
      validates :delivary_price_id
      
      validates :prefectures_id
      
      validates :day_time_id
    end
    validates :price,
    numericality: { only_integer: true },
    numericality: {greater_than: 299,less_than: 10000000} 
  
  
end
