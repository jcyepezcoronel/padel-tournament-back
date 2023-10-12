module Types
  module Schemas
    class UserType < Types::BaseObject
      field :_id, String, null: false
      field :name, String, null: false
      field :email, String, null: false
      field :category, Types::Schemas::CategoryType, null: true
    end
  end
end
