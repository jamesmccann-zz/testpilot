email_settings = YAML.load_file("#{Rails.root.to_s}/config/email.yml")[Rails.env.to_s]

Rails.application.config.action_mailer.default_url_options = {
  host: email_settings.delete(:url_host) || "localhost:3000"
}

Rails.application.config.action_mailer.delivery_method = email_settings.delete(:delivery_method)
Rails.application.config.action_mailer.smtp_settings = email_settings
