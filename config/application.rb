require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module HouseRentApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.session_store :cookie_store, key: '_interslice_session'

    config.middleware.use ActionDispatch::Cookies

    config.middleware.use config.session_store, config.session_options

    config.jwt_secret_key = '775c6b9dc5011fa550fed30e743ab17ba29181cb02c1aaf38772cfefce815a48676908ab9710be17a134590f4f516025c1b6ad09a8efa3c85b3dde0bbbf896fe'

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    
  end
end
