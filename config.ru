# This file is used by Rack-based servers to start the application.

module CrmLogger
  class << self
    attr_accessor :commands
    def log cmd, msg = nil
      @commands ||= []
      @commands << "#{cmd}#{ " - #{msg}" if msg}"
    end
  end
end


require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
