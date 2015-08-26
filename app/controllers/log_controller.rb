#require Rails.root.join("config.ru").to_s
class LogController < ApplicationController
  def index
    #render inline: "<ul>#{ CrmLogger.commands.map{|c| "<li>#{c}</li>" }.join("") }<ul>"
  end
end