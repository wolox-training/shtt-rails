module Api
  module V1
    class BooksController < ApplicationController
      before_action :authenticate_user!
      include Wor::Paginate

      def index
        render_paginated Book.where(query_params), each_serializer: IndexBookSerializer
      end

      def show
        book = Book.find(params[:id])
        render json: book, serializer: ShowBookSerializer
      end

      private

      def query_params
        params.permit(:genre, :author, :title)
      end
    end
  end
end
