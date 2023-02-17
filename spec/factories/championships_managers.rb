FactoryBot.define do
  factory :championships_manager do
    user { create(:user) }
    championship { create(:championship) }
  end
end