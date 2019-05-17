class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.secrets.mailer[:email_from]
  layout 'mailer'
end
