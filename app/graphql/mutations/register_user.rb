require_relative '../../interactors/user/register_user'

module Mutations
  class RegisterUser < BaseMutation
    include ExecutionErrorResponder

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
