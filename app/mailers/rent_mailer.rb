class RentMailer < ApplicationMailer
  def rent_book_email
    @user = params[:user]
    @book = params[:book]
    @rent = params[:rent]
    @current_date = DateTime.current
    I18n.locale = @user['locale'] || I18n.default_locale
    mail(to: @user['email'], subject: 'Info rent book')
  end
end
