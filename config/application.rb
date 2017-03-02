require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BackgammonApi
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins ENV['BG_ALOWED_ORIGIN'].to_s
        resource '*',
                 headers: :any,
                 methods: [:get, :post, :put, :patch, :options, :delete]
      end
    end
  end
end
