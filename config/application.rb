require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module RailsAngularDevise
  class Application < Rails::Application

    config.app_name = 'StartupRI'

    config.middleware.insert_before "ActionDispatch::Static", "Rack::Cors" do
      allow do
        origins '*'
        resource '*',
          :headers => :any,
          :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client', 'message', 'business_id'],
          :methods => [:get, :post, :options, :delete, :put]
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Eastern Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en

    # Makes Bower work for Angular app
    # config.assets.paths << Rails.root.join("vendor","assets","bower_components")

    # This is required for rails to handle our angular JavaScript manifest nicely
    config.assets.precompile += %w( ng-application.js teaspoon.css jasmine/1.3.1.js teaspoon-jasmine.js application-mobile.css )
  end
end
