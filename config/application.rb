require File.expand_path('../boot', __FILE__)

#require 'rails/all'

require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'active_model/railtie'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RemoveDuplicates
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    #config.active_record.raise_in_transactional_callbacks = true
    config.secret_token = 'de0afcfcdbf5e7f0881c6b7eb1cdfed900b42054a59a33c1dbb4f0685928e23d37c90187e942c9f94efaac79e0e8e1cc07d5ead233655bc1f44d4476169d6ac4'
  end
end
