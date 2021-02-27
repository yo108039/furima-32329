FactoryBot.define do
  factory :item do
    name               {"テスト商品"}
    detail               {Faker::Lorem.sentence}
    category_id               {"2"}
    status_id               {"2"}
    delivery_price_id               {"3"}
    delivery_area_id               {"5"}
    delivery_day_id               {"2"}
    price               {"500"}
    
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
