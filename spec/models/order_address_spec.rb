require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @order = FactoryBot.build(:order_address, user_id: @user, item_id: @item)
    
  end
  
  context 'ユーザー登録ができる時' do
    it "全ての情報があれば保存ができること" do
      expect(@order).to be_valid
    end

    it "buildnameが空でも登録できること" do
      @order.buildname = ""
      expect(@order).to be_valid
    end
  end
 
  context 'ユーザー登録ができない時' do
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

    it "phonenameがからでは登録するとこができない" do
      @order.phonename = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Phonename can't be blank")

    end

    it "郵便番号はハイフン無しでは購入できないこと" do
      @order.postalcade= '2543654'
      @order.valid?
      expect(@order.errors.full_messages).to include("Postalcade is invalid. Include hyphen(-)")
    end

    it "電話番号は12桁以上では購入できないこと" do
      @order.phonename = '123456789012'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phonename is too long (maximum is 11 characters)")
    end

    it "電話番号は英数混合では購入できないこと" do
      @order.phonename = '1235689gfgyfy'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phonename is not a number", "Phonename is too long (maximum is 11 characters)")
    end

    it "user_idが空だと購入できないこと" do
      @order.user_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空だと購入できないこと" do
      @order.item_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
  end
end