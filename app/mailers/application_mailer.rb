class ApplicationMailer < ActionMailer::Base
  default from: "from@#{Rails.application.config.hostname}"
  layout 'mailer'
end
