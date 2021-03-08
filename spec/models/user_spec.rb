require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
        it 'nameとemail、passwordとpassword_confirmation, name_familyとname_first, name_family_kanaとname_first_kanaが存在すれば登録できる' do
          expect(@user).to be_valid
        end
      end
    context '新規登録できない時' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが一致しなければ登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '全角漢字のみ苗字が空では登録できない' do
        @user.name_family = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name family can't be blank", "Name family is invalid")
      end
      it '全角漢字の名前が空では登録できない' do
        @user.name_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first can't be blank", "Name first is invalid")
      end
      it 'カナの苗字が空では登録できない' do
        @user.name_family_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name family kana can't be blank", "Name family kana is invalid")
      end
      it 'かなの名前が空では登録できない' do
        @user.name_first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first kana can't be blank", "Name first kana is invalid")
      end
      it '誕生日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'passwordは６文字以上でないと登録できないこと' do
        @user.password = 'a1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)", "Password is invalid")
      end
      it 'passwordは英語のみでは登録できないこと' do
        @user.password = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは数字のみでは登録できないこと' do
        @user.password = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは全角では登録できないこと' do
        @user.password = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)", "Password is invalid")
      end
      it 'emailは＠を含まないと登録できない' do
        @user.email = '12345asd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'emailは一意性であること' do
        @user.email = '123456a'
        another_user = @user.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '苗字が漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.name_family = 'aaaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name family is invalid")
      end
      it '名前が漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.name_first = 'aaaaaaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first is invalid")
      end
      it 'カナの苗字が全角カタカナ以外では登録できないこと' do
        @user.name_family_kana = 'aaaaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name family kana is invalid")
      end
      it 'カナの名前が全角カタカナ以外では登録できないこと' do
        @user.name_first_kana = 'aaaaaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first kana is invalid")
      end
    end
  end
end
