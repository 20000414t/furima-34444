require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品を出品できる時' do
      it '全ての空欄を条件通りに埋めている時' do
      @item
      end
    end
    context '商品を出品できない時' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'infoが空では登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      
      it 'categroy_idが0では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'item_status_idが0では登録できない' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it 'delivary_price_idが0では登録できない' do
        @item.delivary_price_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivary price can't be blank")
      end
      it 'prefectures_idが0では登録できない' do
        @item.prefectures_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank")
      end
      it 'day_time_idが0では登録できない' do
        @item.day_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day time can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが全角だと登録できない'
      @item.price = '１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be invalid")
      end

        it '数字以外で混じっていると登録できない'
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '300円未満では登録できない'
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be less than 300")
      end

      it '9999999円以上だと登録できない'
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be greater than 9999999")
      end

    end 
  end
end
