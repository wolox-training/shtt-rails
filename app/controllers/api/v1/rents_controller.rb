module Api
  module V1
    class RentsController < ApiController
      def index
        scope = policy_scope Rent
        render_paginated scope
      end

      def create
        rent = Rent.create(rent_params)
        auhorized = authorize rent
        render json: auhorized, status: :created if rent.valid?
      end

      private

      def rent_params
        params.require(:rent).permit(:user_id, :book_id, :start_date_rent, :end_date_rent)
      end
    end
  end
end
