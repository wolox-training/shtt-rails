class Rent < ApplicationRecord
  include Concerns::SearchFilters
  belongs_to :user
  belongs_to :book
  validates_associated :user, :book
  validates :start_date_rent, :end_date_rent, presence: true
  after_create_commit :send_rent_email

  def send_rent_email
    RentEmailWorker.perform_async(user.to_json, book.to_json, to_json)
  end
end
