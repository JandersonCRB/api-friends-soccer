FactoryBot.define do
  factory :championship do
    name { "Primeira divisão de #{Faker::Nation.capital_city}"  }
    owner_id { create(:user).id }
  end
end
