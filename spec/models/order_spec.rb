require 'rails_helper'

RSpec.describe Order, type: :model do

  before do
    @order = FactoryBot.build(:order_address)
    # @order = @items.price
  end
  # before do
  #   @order = FactoryBot.build(:order)
  # end

  it "tokenがあれば保存ができること" do
    expect(@order).to be_valid
  end
 
  # it "priceが空では保存ができないこと" do
  #   @order.price = nil
  #   @order.valid?
  #   expect(@order.errors.full_messages).to include("Price can't be blank")
  # end

  it "tokenが空では登録できないこと" do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end
end