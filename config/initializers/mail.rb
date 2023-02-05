# frozen_string_literal: true

Mail.defaults do
  delivery_method :smtp, {
    address: ENV.fetch("SES_ADDRESS", 'localhost'),
    port: ENV.fetch("SES_PORT", nil),
    user_name: ENV.fetch("SMTP_USERNAME", nil),
    password: ENV.fetch("SMTP_PASSWORD", nil),
    authentication: nil,
    enable_starttls_auto: false
  }
end
