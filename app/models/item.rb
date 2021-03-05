class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :buy

  with_options presence: true do
    validates :name
    validates :image
    validates :info
    validates :category_id
    validates :item_status_id
    validates :delivary_price_id
    validates :prefectures_id
    validates :day_time_id
    validates :price,
    numericality: { only_integer: true },
    numericality: {greater_than: 300,less_than: 9999999} 
  end
  
end
