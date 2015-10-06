require 'bundler'
require 'bundler/dsl'
module BundlerExtensions
  @local_gems = {}
  @invalid_options = []
  class << self
    attr_accessor :local_gems
    attr_accessor :invalid_options
  end

  def local_gem gem_name, **options
    local = true
    if local
      options[:path] ||= "gems/#{gem_name}"
    else
      options[:github] ||= "VoroninNick/#{gem_name}"
    end

    BundlerExtensions.local_gems[gem_name.to_sym] = options

    #git_names = Bundler::Dsl@git_sources.keys.map(&:to_s)


    #options.delete_if {|k, v| invalid_keys(k).any? }
    options = select_valid_options(options)

    gem gem_name, options

  end

  def invalid_keys(opts)
    opts.keys.map(&:to_sym).select{|k| !all_valid_keys.map(&:to_sym).include? }

  end

  def delete_invalid_keys(options)
    options.delete_if {|k, v| !all_valid_keys.include?(k.to_sym) }
  end

  def select_valid_options(options)
    options.select {|k, v| all_valid_keys.include?(k.to_sym) }
  end

  def all_valid_keys
    git_names = @git_sources.keys.map(&:to_s)
    (valid_keys + git_names).map(&:to_sym).uniq
  end

  def valid_options

  end

end



if Bundler.const_defined?("Dsl")
  Bundler.const_get("Dsl").send(:include, BundlerExtensions)
end