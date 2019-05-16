class Rent < ApplicationRecord
  include Concerns::SearchFilters
  belongs_to :user
  belongs_to :book
  validates_associated :user, :book
  validates :start_date_rent, :end_date_rent, presence: true

end
