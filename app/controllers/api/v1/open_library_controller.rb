module Api
  module V1
    class OpenLibraryController < ApiController
      def show
        books = OpenLibrary.new(params[:isbn]).books
        render json: books
      end
    end
  end
end
