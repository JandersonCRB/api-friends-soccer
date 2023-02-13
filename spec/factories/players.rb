FactoryBot.define do
  factory :player do
    first_name { "MyString" }
    last_name { "MyString" }
    user { nil }
    championship { nil }
  end
end
