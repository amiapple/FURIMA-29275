FactoryBot.define do
  factory :sending_destination do
    postal_code              {'123-4567' }
    shipping_area_id         {'2'}
    city                     {'札幌市'}
    addresses                {'中央区'}
    phone_number             {'09012345678'}
    token                    {'sample12345'}
  end
end
