# frozen_string_literal: true

p "Seeding users"

user_data = [
  { email: "admin@fs.com", password: "123456", name: "Admin", role: "ADMIN" }
]

user_data.each do |user_hash|
  user = User.find_or_initialize_by(email: user_hash[:email])
  user.password = user_hash[:password]
  user.name = user_hash[:name]
  user.roles = [Role.find_by(code: user_hash[:role])]
  user.save!
end
