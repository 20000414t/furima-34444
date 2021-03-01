require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

describe 'ユーザー新規登録' do
  context '新規登録できる時' do
    it 'nameとemail、passwordとpassword_confirmation, name_familyとname_first, name_family_kanaとname_first_kanaが存在すれば登録できる' do
      @user = FactoryBot.build(:user)
    end
  context '新規登録できない時' do
  it 'nameが空では登録できない' do
    @user.name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("name can't be blank")
  end
  it 'emailが空では登録できない' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("email can't be blank")
  end
  it 'passwordが空では登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("password can't be blank")
  end
  it 'passwordが一致しなければ登録できない' do
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("password can't be conflict")
  end
  it '全角漢字のみ苗字が空では登録できない' do
    @user.name_family = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("name_family can't be blank")
  end
  it '全角漢字の名前が空では登録できない' do
    @user.name_first = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("name_first can't be blank")
  end
  it 'カナの苗字が空では登録できない' do
    @user.name_family_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("name_family_kana can't be blank")
  end
  it 'かなの名前が空では登録できない' do
    @user.name_first_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("name_first_kana can't be blank")
  end
  it '誕生日が空では登録できない' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("birthday can't be blank")
  end
  it 'passwordは６文字以上でないと登録できないこと' do
    @user.password = 'a1'
    @user.valid?
    expect(@user.errors.full_messages).to include("password can't be 6 characters or less")
  end
  it 'passwordは英語のみでは登録できないこと' do
    @user.password = 'aaaaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("password can't be only english")
  end
 it 'passwordは数字のみでは登録できないこと' do
  @user.password = '11111111'
  @user.valid?
  expect(@user.errors.full_messages).to include("password can't be only number")
  end
  it 'passwordは全角では登録できないこと' do
    @user.password = 'ああああ'
    @user.valid?
    expect(@user.errors.full_messages).to include("password can't be Full-width")
  end
  it 'emailは＠を含まないと登録できない' do
    @user.email = '12345asd'
    @user.valid?
    expect(@user.errors.full_messages).to include("email can't be nothing @")
  end
  it 'emailは一意性であること' do
    @user.email = '123456a'
    another_user = @user.email
    @user.valid?
    expect(@user.errors.full_messages).to include("email is exists")
  end
  it '苗字が漢字・平仮名・カタカナ以外では登録できないこと' do
    @user.name_family = 'aaaaa1'
    @user.valid?
    expect(@user.errors.full_messages).to include("name_family can't be Number & Alphabet")
  end
  it '名前が漢字・平仮名・カタカナ以外では登録できないこと' do
    @user.name_first = 'aaaaaaaa1'
    @user.valid?
    expect(@user.errors.full_messages).to include("name_first can't be Number & Alphabet")
  end
  it 'カナの苗字が全角カタカナ以外では登録できないこと' do
    @user.name_family_kana = 'aaaaaa1'
    @user.valid?
    expect(@user.errors.full_messages).to include("name_family can't be Number & Alphabet & Kanji & hiragana")
  end
  it 'カナの名前が全角カタカナ以外では登録できないこと' do
    @user.name_first_kana = 'aaaaaaa1'
    @user.valid?
    expect(@user.errors.full_messages).to include("name_first can't be Number & Alphabet & Kanji & hiragana")
  end

end
end
