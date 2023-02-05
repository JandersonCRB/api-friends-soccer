# frozen_string_literal: true

require "aws-sdk-ses"

class UserMailer < ApplicationMailer

  def forgot_password(user, password_reset)
    ses = Aws::SES::Client.new(
      region: "us-west-2",
      credentials: Aws::Credentials.new('w/e', 'w/e'),
      endpoint: "http://localhost:4566"
    )

    @user = user
    response = ses.send_email({
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
                                source: "no-reply@golsfamilia.com"
                              })
  end
end
