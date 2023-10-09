module Mutations
  class RegisterUser < BaseMutation
  include ExecutionErrorResponder

    argument :email, String, required: true
    argument :password, String, required: true

    type Types::Payloads::RegisterUserType

    def resolve(**params)
      result = register_user(params)
      puts result

      result[:success] ? result[:result] : execution_error(message: result[:error])
    end

    private

    def register_user(params)
       # User::Register.cal(user_params: params)
       return {success: true, result: {token: "aoeaoe"}} if params[:email].eql? "test@test.com"
       return {error: "Bad"}
    end
  end
end
