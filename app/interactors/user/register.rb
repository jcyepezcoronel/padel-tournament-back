module UserInteractor
  class Register
    include Interactor

    before do
      email_regrex = /^[\w\-.]+@([\w-]+\.)+[\w-]{2,}$/
      context.fail!(error: 'Email should be valid') unless
        context.user_params[:email].match(email_regrex) && !User.exists?(email: context.user_params[:email])
    end

    before do
      context.fail!(error: 'Category should be valid') unless
        Category.exists?(context.user_params[:categoryId])
    end

    before do
      rules = {
        'must contain at least one lowercase letter' => /[a-z]+/,
        'must contain at least one uppercase letter' => /[A-Z]+/,
        'must contain at least one digit' => /\d+/,
        'must contain at least one special character' => /[^A-Za-z0-9]+/
      }

      rules.each do |message, regex|
        context.fail!(error: message) unless context.user_params[:password].match(regex)
      end
    end

    def call
      category = Category.find(context.user_params[:categoryId])
      context.user = User.new(
        name: context.user_params[:name],
        email: context.user_params[:email],
        password: context.user_params[:password],
        category: category
      )
      context.user.save!
      context.token = 'test'
    end
  end
end
