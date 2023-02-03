# frozen_string_literal: true

module Entities
  class Championship < Grape::Entity
    expose :id, documentation: { type: "Integer", desc: "Championship id" }
    expose :name, documentation: { type: "String", desc: "Championship name" }
    expose :owner, using: User, documentation: { desc: "Championship owner" }
  end
end
