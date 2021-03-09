FactoryBot.define do
  factory :item do
    association :user
    name              {'こんにちは'}
    info              {'こんばんは'}
    price             {1234}
    item_status_id    {1}
    prefecture_id    {2}
    delivary_date_id       {1}
    delivary_price_id {2}
    category_id       {1}
    after(:build) do |item|
      item.image.attach(io: File.open('public/image/aaa.jp.png'), filename: 'test_image.png')
    end
  end
end
