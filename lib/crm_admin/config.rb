require 'crm_admin/config/abstract_model'

module CrmAdmin
  module Config
    class << self
      attr_accessor :initialized

      attr_accessor :current_config_context

      attr_accessor :included_models
      attr_accessor :excluded_models
      attr_accessor :include_translations
      attr_accessor :translations_belongs_to_model
      attr_accessor :visible_models
      attr_accessor :hidden_models





      def initialize
        unless initialized?
          @included_models = CrmAdmin.load_models.map(&:name)
          @excluded_models = []
          @include_translations = true
          @translations_belongs_to_model = true
          @initialized = true

          @visible_models = :all
          @hidden_models = []

          @current_config_context = nil
        end
      end

      def initialized?
        @initialized || false
      end

      def model(entity, &block)
        CrmAdmin.config(entity, &block)
      end
    end
  end

  class << self
    def load_models
      root_folders = ["#{Rails.root}/app/models", "#{Rails.root}/lib"]
      processed_root_folders = []

      root_folders.each do |root_folder|
        folders = Dir["#{root_folder}/**/"].uniq
        files = []
        folders.each do |folder|
          files += Dir["#{folder}/*"].select{|p| !File.directory?(p)  }
        end
        files.each do |file_path|
          require file_path
        end

        const_names = files.map{|filename| relative_path = filename["#{root_folder}/".length, filename.length].gsub(/\.rb\Z/, "");  }

        processed_root_folders << {folder_path: root_folder, folders: folders, files: files, const_names: const_names}

      end


      all_files = []
      all_const_names = []
      processed_root_folders.each do |root_folder|
        all_files += root_folder[:files]
        all_const_names += root_folder[:const_names]
      end

      all_files.uniq
      all_const_names.uniq

      classes = all_const_names.map{|f| s = f.gsub("//", "/").camelize; next s.constantize if Object.const_defined?(s); next nil }.select{|c| !c.nil? && c.instance_of?(Class) }

      return classes
    end
  end
end

CrmAdmin::Config.initialize