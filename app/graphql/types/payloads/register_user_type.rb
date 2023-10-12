module Types
  module Payloads
    class RegisterUserType < Types::BaseObject
      field :token, String, null: false
      field :user, Types::Schemas::UserType, null: false
    end
  end
end
