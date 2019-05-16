module Api
  module V1
    class BooksController < ApplicationController
      before_action :authenticate_user!

      def index
        render_paginated Book, each_serializer: IndexBookSerializer
      end

      def show
        book = Book.find(params[:id])
        render json: book, serializer: ShowBookSerializer
      end
    end
  end
end
