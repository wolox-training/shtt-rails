class RentSerializer < ApplicationSerializer
  attributes :id, :start_date_rent, :end_date_rent
  has_one :book
  has_one :user
end
