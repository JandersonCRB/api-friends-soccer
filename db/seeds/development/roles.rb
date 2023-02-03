# frozen_string_literal: true

p "Seeding roles"

roles_data = [
  { name: "Admin", code: "ADMIN", description: "Application Admin" },
  { name: "User", code: "USER", description: "User" }
]

roles_privileges = {
  ADMIN: %w[ADMIN CREATE_USER],
  USER: %w[CREATE_CHAMPIONSHIP LIST_CHAMPIONSHIPS EDIT_CHAMPIONSHIP CREATE_PLAYER LIST_PLAYERS CREATE_MATCH EDIT_MATCH
           DELETE_MATCH LIST_MATCHES]
}

roles_data.each do |role_data|
  role = Role.find_or_initialize_by(code: role_data[:code])
  role.name = role_data[:name]
  role.description = role_data[:description]

  privileges = roles_privileges[role_data[:code].to_sym]
  privileges ||= []
  privileges.each do |privilege_code|
    privilege = Privilege.find_by(code: privilege_code)
    role.privileges << privilege
  end
  role.save!
end
