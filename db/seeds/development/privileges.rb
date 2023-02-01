# frozen_string_literal: true

# Display database queries
ActiveRecord::Base.logger = Logger.new($stdout)

p "Seeding Privileges"

privilege_data = [
  { name: "Administrative Privileges", code: "ADMIN",
    description: "This privilege indicates that a user is an administrator" },
  { name: "Create User", code: "CREATE_USER",
    description: "This privilege indicates that the user can create a user" },
  { name: "Create Championship", code: "CREATE_CHAMPIONSHIP",
    description: "This privilege indicates that the user can create an championship" },
  { name: "List Championships", code: "LIST_CHAMPIONSHIPS",
    description: "This privilege indicates that the user can list championships" },
  { name: "Edit Championship", code: "EDIT_CHAMPIONSHIP",
    description: "This privilege indicates that the user can edit a championship" },
  { name: "Create Player", code: "CREATE_PLAYER",
    description: "This privilege indicates that the user can create a player" },
  { name: "List Players", code: "LIST_PLAYERS",
    description: "This privilege indicates that the user can list players" },
  { name: "Create Match", code: "CREATE_MATCH",
    description: "This privilege indicates that the user can create a match" },
  { name: "Edit Match", code: "EDIT_MATCH",
    description: "This privilege indicates that the user can edit a match" },
  { name: "Delete Match", code: "DELETE_MATCH",
    description: "This privilege indicates that the user can delete a match" },
  { name: "List Matches", code: "LIST_MATCHES",
    description: "This privilege indicates that the user can list matches" }
]

privilege_data.each do |privilege_hash|
  privilege = Privilege.find_or_create_by(code: privilege_hash[:code])
  privilege.name = privilege_hash[:name]
  privilege.description = privilege_hash[:description]
  privilege.save
end

p "deleting"

privilege_codes = privilege_data.map { |privilege_hash| privilege_hash[:code] }

Privilege.where.not(code: privilege_codes).or(Privilege.where(code: nil)).delete_all
