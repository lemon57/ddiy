require_relative 'boot'

require 'rails/all'
require 'carrierwave'
require "sprockets/railtie"
require "attachinary/orm/active_record"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

config.serve_static_assets = true

module Ddiy
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
