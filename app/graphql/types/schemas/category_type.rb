module Types
  module Schemas
    class CategoryType < Types::BaseObject
      field :_id, String, null: false
      field :name, String, null: false
      field :division, String, null: false
      field :users, [Types::Schemas::UserType], null: true
    end
  end
end
