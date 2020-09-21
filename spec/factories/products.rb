FactoryBot.define do
  factory :product do
    name              { ソファ }
    introduction      { 二人がけの赤いソファです。 }
    price             { '100000' }
    category_id       { '2' }
    condition_id      { '2' }
    postage_id        { '2' }
    shipping_area_id  { '2' }
    preparation_day_id { '2' }
    association :user
    association :comment
    association :product_purchase

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
