module ExecutionErrorResponder
  extend ActiveSupport::Concern

  private

  def execution_error(message: nil, status: :unprocesable_entry, code: 422)
    GraphQL::ExecutionError.new(message, options: {status: status, code:code })
  end
end
