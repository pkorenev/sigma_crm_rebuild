if Gem.loaded_specs.keys.map(&:to_s).include?("auto_reload")
  require 'auto_reload'

  AutoReload.auto_reload_gems :attachable, :addressable
end

