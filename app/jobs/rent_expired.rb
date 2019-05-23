require 'sidekiq-scheduler'
class RentExpired
  include Sidekiq::Worker

  def perform
    rents = Rent.rent_expires_today
    rents.each do |rent|
      RentMailer.with(rent_id: rent).rent_expires_email.deliver_later
    end
  end
end
