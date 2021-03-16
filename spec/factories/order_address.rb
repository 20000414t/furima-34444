FactoryBot.define do
  factory :order_address do
    #price {3000}
    token             {"tok_abcdefghijk00000000000000000"}
    prefectures_id  {1}
    postalcade       {'123-1234'}
    cities           {'123'}
    streetadoress    {'123'}
    buildname        {'123'}
    phonename        {'123'}
    user_id           {1}
    item_id          {1}
  end
end
