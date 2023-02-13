FactoryBot.define do
  factory :match do
    championship_edition { nil }
    match_datetime { Faker::Date.between(from: "2022-01-01", to: "2023-01-01") }
  end
end
