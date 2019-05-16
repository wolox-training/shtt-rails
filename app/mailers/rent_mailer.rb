class RentMailer < ApplicationMailer
  def rent_book_email
    @user = params[:user]
    @book = params[:book]
    @rent = params[:rent]
    @current_date = DateTime.current
    mail(to: @user['email'], subject: 'Info rent book')
  end
end
