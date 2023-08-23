FactoryBot.define do
  factory :user do
    nickname {Faker::Name.prefix}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    last_name_kana { Faker::Name.last_name }
    first_name_kana { Faker::Name.first_name }
    birthday { Faker::Date.between(from: 80.years.ago, to: 5.years.ago) }
  end
end