FactoryBot.define do
  factory :article do
    title {Faker::Lorem.characters(number: 10..50)}
    body {"Mytext"}
    user
  end
end
