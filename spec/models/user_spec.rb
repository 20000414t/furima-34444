require 'rails_helper'

RSpec.describe User, type: :model do
describe 'ユーザー新規登録' do
  it 'nameが空では登録できない' do
    user = User.new(name: '',email: 'test@test', password: '012345a', password_confiramtion: '012345a', name_family: '山田', name_first:'太郎', name_family_kana:'ヤマダ', name_first_kana:'タロウ', birthday: '2000-01-01')
    user.valid?
    expect(user.errors.full_messages).to include("name can't be blank")
  end
  it 'emailが空では登録できない' do
    user = User.new(name: 'kuririn',email: '', password: '012345a', password_confiramtion: '012345a', name_family: '山田', name_first:'太郎', name_family_kana:'ヤマダ', name_first_kana:'タロウ', birthday: '2000-01-01')
    user.valid?
    expect(user.errors.full_messages).to include("email can't be blank")
  end
  it 'passwordが空では登録できない' do
    user = User.new(name: 'kuririn',email: 'test@test', password: '', password_confiramtion: '012345a', name_family: '山田', name_first:'太郎', name_family_kana:'ヤマダ', name_first_kana:'タロウ', birthday: '2000-01-01')
    user.valid?
    expect(user.errors.full_messages).to include("password can't be blank")
  end
  it 'passwordが一致しなければ登録できない' do
    user = User.new(name: 'kuririn',email: 'test@test', password: '012345a', password_confiramtion: '012345ac', name_family: '山田', name_first:'太郎', name_family_kana:'ヤマダ', name_first_kana:'タロウ', birthday: '2000-01-01')
    user.valid?
    expect(user.errors.full_messages).to include("password can't be conflict")
  end
  it '全角漢字のみ苗字が空では登録できない' do
    user = User.new(name: 'kuririn',email: 'test@test', password: '012345a', password_confiramtion: '012345a', name_family: '', name_first:'太郎', name_family_kana:'ヤマダ', name_first_kana:'タロウ', birthday: '2000-01-01')
    user.valid?
    expect(user.errors.full_messages).to include("name_family can't be blank")
  end
  it '全角漢字の名前が空では登録できない' do
    user = User.new(name: 'kuririn',email: 'test@test', password: '012345a', password_confiramtion: '012345a', name_family: '山田', name_first:'', name_family_kana:'ヤマダ', name_first_kana:'タロウ', birthday: '2000-01-01')
    user.valid?
    expect(user.errors.full_messages).to include("name_first can't be blank")
  end
  it 'カナの苗字が空では登録できない' do
    user = User.new(name: 'kuririn',email: 'test@test', password: '012345a', password_confiramtion: '012345a', name_family: '山田', name_first:'太郎', name_family_kana:'', name_first_kana:'タロウ', birthday: '2000-01-01')
    user.valid?
    expect(user.errors.full_messages).to include("name_family_kana can't be blank")
  end
  it 'かなの名前が空では登録できない' do
    user = User.new(name: 'kuririn',email: 'test@test', password: '012345a', password_confiramtion: '012345a', name_family: '山田', name_first:'太郎', name_family_kana:'ヤマダ', name_first_kana:'', birthday: '2000-01-01')
    user.valid?
    expect(user.errors.full_messages).to include("name_first_kana can't be blank")
  end
  it '誕生日が空では登録できない' do
    user = User.new(name: 'kuririn',email: 'test@test', password: '012345a', password_confiramtion: '012345a', name_family: '山田', name_first:'太郎', name_family_kana:'ヤマダ', name_first_kana:'タロウ', birthday: '')
    user.valid?
    expect(user.errors.full_messages).to include("birthday can't be blank")
  end
  it '' do
  end
  it '' do
  end

end
end
