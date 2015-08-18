#!/usr/bin/env ruby
#!/bin/bash


# begin
#   load File.expand_path("../spring", __FILE__)
# rescue LoadError
# end
# APP_PATH = File.expand_path('../../config/application', __FILE__)
# require_relative '../config/boot'
# require 'rails/commands'


gem_name = ARGV[0]

def add_gem_to_gemfile(name)
  gem_name = name

end

def new_gem(name)
  gem_name = name
  if !File.exists?("../gems/#{gem_name}")
    new_gem_cmd = "bundle gem ../gems/#{gem_name}"

    ln_cmd = "ln -sr ../gems/#{gem_name} gems/#{gem_name}"

    cmd = "#{new_gem_cmd} && #{ln_cmd}"
    puts cmd
    exec(cmd)
  end
end

def new_engine(name)
  gem_name = name

  if !File.exists?("../engines/#{gem_name}")
    new_engine_cmd = "rails plugin new ../engines/#{gem_name}"

    ln_cmd = "ln -sr ../engines/#{gem_name} engines/#{gem_name}"

    cmd = "#{new_engine_cmd} && #{ln_cmd}"
    puts cmd
    exec(cmd)
  end
end
#echo "hello"

