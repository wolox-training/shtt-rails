module Error
  module ErrorHandler
    def self.included(cla)
      cla.class_eval do
        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      end
    end

    private

    def record_not_found(error)
      render json: { error: error.to_s }, status: :not_found
    end
  end
end
