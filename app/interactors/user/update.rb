module UserInteractor
  class Update
    include Interactor

    before do
      context.fail!(error: 'User should be valid') unless User.exists?(context.user_id)

      context.user = User.find(context.user_id)
      context.fail!(error: 'Email should be valid') unless
        !context.user_params[:email] ||
        context.user_params[:email].match(email_regrex) && (
          context.user[:email] == context.user_params[:email] ||
          !User.exists?(email: context.user_params[:email])
        )
    end

    def call
      user_params.each_key do |key|
        context.user[key] = user_params[key]
      end
      context.user.save!
    end
  end
end
