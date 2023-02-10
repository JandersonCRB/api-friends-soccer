# frozen_string_literal: true

module Entities
  class User < Grape::Entity
    format_with(:utc_iso8601) do |date|
      date.utc.iso8601(3) if date.present?
    end

    expose :id, documentation: { type: "String", desc: "User Id" }
    expose :first_name, documentation: { type: "String", desc: "User's first name" }
    expose :last_name, documentation: { type: "String", desc: "User's last name" }
    expose :email, documentation: { type: "String", desc: "User email" }
    expose :roles, documentation: { type: "String", desc: "User roles" }
    expose :privileges, documentation: { type: Array, desc: "User privileges" }
  end
end
