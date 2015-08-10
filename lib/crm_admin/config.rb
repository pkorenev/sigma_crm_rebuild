require 'has_fields'
require 'crm_admin/config/abstract_model'
require 'crm_admin/config/model_config'

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


      def hide_models(models)
        models.each do |m|

          real_model = false

          i = @visible_models.map(&:classify).index(m.classify)
          @visible_models.delete_at(i)
        end
      end


      def initialize
        unless initialized?
          @included_models = CrmAdmin.load_models.map(&:name)
          @excluded_models = []
          @include_translations = true
          @translations_belongs_to_model = true
          @initialized = true

          @visible_models = @included_models # :all
          @hidden_models = []

          @current_config_context = nil
        end
      end

      def build_config
        counter = 0
        @included_models.each do |model|
          if model.is_a?(String) || model.is_a?(Symbol)
            puts model
            next if !const_defined?(model) rescue next
            puts "after next"
            model = model.constantize
          end
          model_name = model.name
          crm_admin_class_name = "CrmAdmin"

          ########

          const_defined = Object.const_defined?("#{model_name}::#{crm_admin_class_name}")

          const = const_defined ? ("#{model}::#{crm_admin_class_name}").constantize : nil
          defined_class = const.try{|c| c.instance_of?(Class) }
          next if defined_class && const.superclass != Object




          counter += 1
          #model_crm_admin = Class.new
          # model.class_eval do
          #
          # end
          #model.module_eval "class #{crm_admin_class_name};end;"

          if !defined_class
            model.const_set crm_admin_class_name, Class.new(CrmAdmin::Config::ModelConfig)
          else

          end

        end

        return counter
      end

      def initialized?
        @initialized || false
      end

      def model(entity, &block)
        CrmAdmin.config(entity, &block)
      end

      def instance(instance, &block)
        CrmAdmin.config(instance, &block)
      end
    end
  end

  class << self
    def load_models
      root_folders = ["#{Rails.root}/app/models", "#{Rails.root}/lib"]
      processed_root_folders = []

      root_folders.each do |root_folder|
        folders = Dir["#{root_folder}/**/"].uniq.select{|f| f.scan(/lib\/crm_admin\//).length == 0 }
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