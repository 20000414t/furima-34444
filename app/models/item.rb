class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :buy

  with_options presence: true do
    validates :image
    validates :info
    validates :category_id
    validates :item_status_id
    validates :delivary_price_id
    validates :prefectures_id
    validates :day_time_id
    validates :price,
    format: {
      with: 300 =< price && price =< 9999999}
    validates :price,
      format: {
        with: /^[0-9]+$/}
  end
  
end
