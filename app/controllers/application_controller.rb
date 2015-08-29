

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception


  #before_action :self_reload_application
  #before_action :reload_rails_admin_plugins

  #before_action do
    #render inline: request.headers["SERVER_NAME"].inspect + "<br/>" + params.inspect + "<br/>" + crm?.inspect

  #end

  # application
  with_options if: :reload_libs? do
    before_action :reload_gems
    before_action :reload_rails_admin_config
    before_action :reload_libs
    before_action :reload_initializers
  end

  def  test_page
    @apartment = Apartment.new
    render layout: false
  end

  def reload_gems
    #RequireReloader.send(:local_gems)
  end

  def reload_lib
    files_to_reload = []
    ["lib/**/*.rb"].each{|p| files_to_reload += Dir[Rails.root.join(p)] }

    reload_files(files_to_reload)
  end

  def reload_files(files_to_reload)
    files_to_reload.each do |f|
      begin
        #require_dependency f
        load f
      rescue RuntimeError
      end
    end
  end

  def reload_libs
    if Rails.env.development?

      files_to_reload = []
      ["lib/**/*.rb", "config/initializers/**/*.rb"].each{|p| files_to_reload += Dir[Rails.root.join(p)] }

      reload_files(files_to_reload)

    end
  end

  def reload_initializers
    if Rails.env.development?

      files_to_reload = []
      [ "config/initializers/**/*.rb"].each{|p| files_to_reload += Dir[Rails.root.join(p)] }

      reload_files(files_to_reload)
    end
  end


  def reload_libs?
    true
  end


  def reload_rails_admin_config
    RailsAdmin::Config.reset
    RailsAdmin::Config.models.each do |m|
      RailsAdmin::Config.reset_model(m.abstract_model.model_name)
    end

    #load("#{Rails.root}/config/initializers/rails_admin.rb")
  end

  def reload_rails_admin_plugins
    # helper = RequireReloader::Helper.new
    # gem_name = "rails_admin"
    # helper.remove_gem_module_if_defined(gem_name)
    # require gem_name
  end

  def json_request?
    request.format.json?
  end

  def crm?
    request.subdomain == "crm"
  end
end
