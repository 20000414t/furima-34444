class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :buy

  with_options presence: true do
    validates :name
    validates :image
    validates :info
    validates :category_id,
    numericality: {other_than: 0}
    validates :item_status_id,
    numericality: {other_than: 0}
    validates :delivary_price_id,
    numericality: {other_than: 0}
    validates :prefectures_id,
    numericality: {other_than: 0}
    validates :day_time_id,
    numericality: {other_than: 0}
    validates :price,
    numericality: { only_integer: true },
    numericality: {greater_than: 300,less_than: 9999999} 
  end
  
end
