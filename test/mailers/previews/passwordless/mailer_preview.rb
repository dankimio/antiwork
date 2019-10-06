module Passwordless
  class MailerPreview < ActionMailer::Preview
    def magic_link
      session = Session.create!(
        remote_addr: "0.0.0.0",
        user_agent: "wooden box",
        authenticatable: Company.first
      )
      Passwordless::Mailer.magic_link(session)
    end
  end
end
