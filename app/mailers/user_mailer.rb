# frozen_string_literal: true

require "aws-sdk-ses"

class UserMailer < ApplicationMailer
  def forgot_password(user, password_reset)
    ses = Aws::SES::Client.new(
      region: "us-west-2",
      credentials: Aws::Credentials.new(ENV.fetch("AWS_ACCESS_KEY", "w/e"), ENV.fetch("AWS_SECRET_KEY", "w/e")),
      endpoint: "http://localhost:4566"
    )

    @reset_url = ENV.fetch("RESET_PASSWORD_URL", "http://localhost:3000/reset_password") +
                 "?token=#{password_reset.token}"
    @user = user
    ses.send_email({
                     destination: {
                       to_addresses: [
                         @user.email
                       ]
                     },
                     message: {
                       subject: {
                         data: "Reset Your Password"
                       },
                       body: {
                         html: {
                           data: render_to_string("user_mailer/forgot_password")
                         }
                       }
                     },
                     source: "no-reply@familiaemcampo.com"
                   })
  end
end
