class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def unprocessable_entity(exception)
    render plain: "Unprocessable Entity #{exception.record.errors}", status: :unprocessable_entity
  end

  def record_not_found(exception)
    render plain: "404 Not Found #{exception.message}", status: :not_found
  end
end
