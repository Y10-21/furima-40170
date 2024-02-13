FactoryBot.define do
  factory :purchase_address do
    token { 'tok_abcdefghijk00000000000000000' }
    post_number { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    post_city { Faker::Address.city }
    post_address { Faker::Address.building_number }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    telephone_number { Faker::Number.number(digits: rand(10..11)) }
  end
end
