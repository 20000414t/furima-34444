FactoryBot.define do
  factory :user do
    name                      {'test'}
    email                     {'test@test00'}
    password                  {'testtest1'}
    password_confirmation     {'testtest1'}
    name_family               {'山田'}
    name_first                {'太郎'}
    name_family_kana          {'ヤマダ'}
    name_first_kana           {'タロウ'}
    birthday                  {'2000-01-01'}
  end
 
end
