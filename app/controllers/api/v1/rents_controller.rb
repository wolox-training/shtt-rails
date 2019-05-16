module Api
  module V1
    class RentsController < ApiController
      def index
        render_paginated Rent
      end

      def create
        rent = Rent.create!(rent_params)
        RentMailer.with(rent_id: rent.id).rent_book_email.deliver_later
        render json: rent, status: :created if rent.valid?
      end

      private

      def rent_params
        params.require(:rent).permit(:user_id, :book_id, :start_date_rent, :end_date_rent)
      end
    end
  end
end
