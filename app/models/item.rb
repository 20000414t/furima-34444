class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivary_date
  belongs_to :delivary_price
  belongs_to :order
  belongs_to :address
  



  has_one_attached :image
  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :name
    validates :image
    validates :info
    with_options numericality: {other_than: 0} do
      validates :category_id
    
      validates :item_status_id
      
      validates :delivary_price_id
      
      validates :prefecture_id
      
      validates :delivary_date_id
    end
    validates :price,
    numericality: { only_integer: true },
    numericality: {greater_than: 299,less_than: 10000000} 
  end
  
end
