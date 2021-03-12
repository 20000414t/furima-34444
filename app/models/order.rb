class Order < ApplicationRecord
  include ActiveModel
    attr_accessor :user_id, :item_id
 
  belongs_to :user
  belongs_to :item
  has_one    :address
  has_one    :order

end
