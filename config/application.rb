require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sigma
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.available_locales = [:uk, :en]
    config.i18n.default_locale = :uk

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.active_record.whitelist_attributes = true

    # if Rails.env.development?
    #   # reload_gems = %w(addressable) # names of gems which should autoreload
    #   # config.autoload_paths += Gem.loaded_specs.values.inject([]){ |a,gem| a += gem.load_paths if reload_gems.include? gem.name; a }
    #   # require 'active_support/dependencies'
    #   # ActiveSupport::Dependencies.explicitly_unloadable_constants += reload_gems.map { |gem| gem.classify }
    #
    #   config.autoload_paths += %W(#{config.root}/vendor/gems/*/lib)
    #   config.autoload_paths += Dir["#{config.root}/vendor/gems/*/lib/**/"]
    # end

    # if ::GEMS_FROM_LOCALHOST
    #   if Rails.env.development?
    #     config.eager_load = true
    #     #RequireReloader.watch("rails_admin")
    #     #RequireReloader.watch_local_gems!
    #
    #
    #     watch_gems = ::PROJECT_GEMS
    #
    #     watch_gems.each do |gem_name|
    #       RequireReloader.watch(gem_name)
    #     end
    #   end
    # end

    #reload_local_gems
  end
end
