FactoryBot.define do
  factory :item do
    image do
      Rack::Test::UploadedFile.new(
        File.open(File.join(Rails.root, 'spec/fixures/test.jpg'))
      )
    end
    item_name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    price { Faker::Number.between(from: 300, to: 9999999) }
    category_id { Faker::Number.between(from: 2, to: 10) }
    condition_id { Faker::Number.between(from: 2, to: 5) }
    postage_id { Faker::Number.between(from: 2, to: 4) }
    region_id { Faker::Number.between(from: 2, to: 10) }
    shipping_date_id { Faker::Number.between(from: 2, to: 4) }
    association :user
    
  end
end
