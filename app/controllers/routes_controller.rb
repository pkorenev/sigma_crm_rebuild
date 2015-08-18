class RoutesController < ApplicationController
  def reload
    Rails.application.class.reload_routes!
    render inline: "routes reloaded"
  end
end