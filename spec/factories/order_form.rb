FactoryBot.define do
  factory :order_form do
    postal_code { Faker::Number.between(from: 100, to: 999).to_s + "-" + Faker::Number.between(from: 1000, to: 9999).to_s }
    region_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    address_number { Faker::Address.street_address }
    building { Faker::Address.building_number }
    tel_number { "0" + Faker::Number.between(from: 100000000, to: 9999999999).to_s }
    association :item
    association :user
  end
end
