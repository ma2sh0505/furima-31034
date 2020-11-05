FactoryBot.define do
  factory :item do
    
    
    name                 {"test"}
    introduction         {"text"}
    category_id          { 2 }
    condition_id         { 2 }
    delivery_burden_id   { 2}
    delivery_area_id     { 2 }
    delivery_day_id      { 2 }
    price                {100000}
    association           :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
