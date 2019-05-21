module Api
  module V1
    class OpenLibraryController < ApiController
      def show
        books = OpenLibrary.new(params[:isbn]).books
        render json: books
      rescue StandardError => e
        render json: { error: e }, status: :bad_request
      end
    end
  end
end
