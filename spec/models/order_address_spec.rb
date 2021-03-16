require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

  before do
    @order = FactoryBot.build(:order_address)
    
  end
  

  it "全ての情報があれば保存ができること" do
    expect(@order).to be_valid
  end
 
 

  it "tokenが空では登録できないこと" do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end
  it "prefecuteres_idが空では登録できない" do
    @order.prefectures_id = 0
    @order.valid?
    expect(@order.errors.full_messages).to include("Prefectures must be other than 0")
  end

  it "postalcadeが空では登録することができない" do
    @order.postalcade = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("Postalcade can't be blank")
  end

  it "citiesが空では登録することができない" do
    @order.cities = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("Cities can't be blank")
  end

  it "streetadoressが空では登録することができない" do
    @order.streetadoress = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("Streetadoress can't be blank")
  end

  it "phonename" do
    @order.phonename = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("Phonename can't be blank")
  end
end