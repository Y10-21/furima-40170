FactoryBot.define do
  factory :purchase do
    association :user
    association :merchandise
  end
end
