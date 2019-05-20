module Api
  module V1
    class BookSuggestionsController < ApiController
      skip_before_action :authenticate_user!, only: [:create]
      def create
        book_s = BookSuggestion.create(book_suggestion_params)
        if book_s.valid?
          render json: book_s, status: :created
        else
          render json: { error: book_s.errors.messages }, status: :unprocessable_entity
        end
      end

      private

      def book_suggestion_params
        params.require(:book_suggestion).permit(:title, :author, :link, :editor, :year, :user_id)
      end
    end
  end
end
