FactoryBot.define do
  factory :item do
    name             { 'テスト' }
    item_description { 'テスト' }
    category_id      { 2 }
    condition_id     { 2 }
    shipping_cost_id { 2 }
    area_id          { 2 }
    shipping_time_id { 2 }
    price            { 300 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
