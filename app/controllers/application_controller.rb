class ApplicationController < ActionController::Base
  include Pundit

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from Timeout::Error, with: :time_out

  private

  def record_not_found(error)
    render json: { error: error.to_s }, status: :not_found
  end

  def user_not_authorized
    render json: { error: 'You are not authorized to perform this action.' }, status: :forbidden
  end

  def time_out
    render json: 'Time out', status: :request_timeout
  end
end
