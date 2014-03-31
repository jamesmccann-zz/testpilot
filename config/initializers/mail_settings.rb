# Redirect mail to Mailcatcher
unless Rails.env.test?
  Rails.application.config.action_mailer.default_url_options = { host: 'localhost:3000' }
  Rails.application.config.action_mailer.delivery_method = :smtp
  Rails.application.config.action_mailer.smtp_settings = { :address => "localhost", :port => 1025 }
end