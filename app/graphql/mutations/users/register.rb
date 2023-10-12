# frozen_string_literal: true

module Mutations
  module Users
    class Register < BaseMutation
      argument :name, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true
      argument :categoryId, String, required: true

      type Types::Payloads::RegisterUserType

      def resolve(**params)
        result = UserInteractor::Register.call(user_params: params)
        result.success? ? result : execution_error(message: result.error)
      end
    end
  end
end
