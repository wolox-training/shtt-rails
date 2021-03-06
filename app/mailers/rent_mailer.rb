class RentMailer < ApplicationMailer
  def rent_book_email
    @rent = Rent.find(params[:rent_id])
    @user = @rent.user
    @book = @rent.book
    @current_date = DateTime.current
    I18n.locale = @user[:locale] || I18n.default_locale
    mail(to: @user[:email], subject: 'Info rent book')
  end

  def rent_expires_email
    @rent = Rent.find(params[:rent_id])
    @user = @rent.user
    @book = @rent.book
    I18n.locale = @user[:locale] || I18n.default_locale
    mail(to: @user[:email], subject: 'Alert rent expires')
  end
end
