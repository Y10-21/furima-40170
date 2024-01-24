FactoryBot.define do
  factory :merchandise do
    name { Faker::Name.unique.name[1..40] }
    explanation { Faker::Lorem.sentence[1..1000] }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    shipping_day_id { Faker::Number.between(from: 2, to: 4) }
    shipping_load_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    price { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    after(:build) do |merchandise|
      merchandise.image.attach(io: File.open('public/images/test.jpeg'), filename: 'test.jpeg')
    end
  end
end