# Load the Rails application.
require_relative 'application'

Rails.application.configure do

  file = YAML.load_file(Rails.root.join("config", "aws.yml"))
  # config/environments/production.rb
  config.paperclip_defaults = {
    storage: :s3,
    s3_credentials: {
      bucket: file[Rails.env]["bucket"],
      access_key_id: file[Rails.env]["access"],
      secret_access_key: file[Rails.env]["secret"],
      s3_region: file[Rails.env]["region"],
    }
  }
  
  config.i18n.default_locale = "es-MX"

end

# Initialize the Rails application.
Rails.application.initialize!
