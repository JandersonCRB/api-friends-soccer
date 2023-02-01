# frozen_string_literal: true

module Entities
  class User < Grape::Entity
    format_with(:utc_iso8601) do |date|
      date.utc.iso8601(3) if date.present?
    end

    expose :id, documentation: { type: "String", desc: "User Id" }
    expose :name, documentation: { type: "String", desc: "User name" }
    expose :email, documentation: { type: "String", desc: "User email" }
    expose :roles, documentation: { type: "String", desc: "User roles" }
    expose :privileges, documentation: { type: Array, desc: "User privileges" }
  end
end
