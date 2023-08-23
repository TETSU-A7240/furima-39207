FactoryBot.define do
  factory :user do
    nickname {Faker::Name.prefix}
    email {Faker::Internet.free_email}
    password { "g9" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name { "山田" }
    first_name { "太郎" }
    last_name_kana { "ヤマダ" }
    first_name_kana { "タロウ" }
    birthday { Faker::Date.between(from: 80.years.ago, to: 5.years.ago) }
  end
end