class RentEmailWorker
  include Sidekiq::Worker

  def perform(*args)
    args = args.map { |arg| JSON.parse(arg) }
    RentMailer.with(user: args[0], book: args[1], rent: args[2]).rent_book_email.deliver_now
  end
end
