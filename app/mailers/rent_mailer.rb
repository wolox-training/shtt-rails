class RentMailer < ApplicationMailer
  def rent_book_email
    @rent = Rent.find(params[:rent_id])
    @user = @rent.user
    @book = @rent.book
    @current_date = DateTime.current
    mail(to: @user[:email], subject: 'Info rent book')
  end
end
