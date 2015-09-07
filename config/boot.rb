ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

# custom functions
require_relative "../bin/bundler_extensions"

require 'bundler/setup' # Set up gems listed in the Gemfile.
