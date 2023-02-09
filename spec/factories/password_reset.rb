FactoryBot.define do
  factory :password_reset do
    user_id { 1 }
    token { Faker::String.unique.random(length: 32) }
    expires_at { Faker::Time.forward(days: 1) }
  end
end