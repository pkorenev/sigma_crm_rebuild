require 'test_methods'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  include TestMethods

  before_action :reload_application

  def json_request?
    request.format.json?
  end
end
