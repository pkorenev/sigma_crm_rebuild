if Gem.loaded_specs.keys.map(&:to_s).include?("auto_reload")
  require 'auto_reload'

  #Gem.loaded_specs.select{|g| gem_name, spec = g.first, g.second; break !!spec.source.options['auto_reload'] }.each {|g| gem_name = g.first; AutoReload.auto_reload_gems(gem_name) }
  BundlerExtensions.local_gems.select{|gem_name, options| next !!options[:auto_reload] }.each {|gem_name, options| AutoReload.auto_reload_gems(gem_name) }

end

