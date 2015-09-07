

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

  def  test_page
    @apartment = Apartment.new
    render layout: false
  end

  def crm?
    request.subdomain == "crm"
  end
end
