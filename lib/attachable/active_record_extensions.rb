module Attachable
  module ActiveRecordExtensions
    extend ActiveSupport::Concern

    module ClassMethods
      def get_caller_file_name &block
        block.send :eval, "__FILE__"
      end

      def has_attachments(name = nil, **options)
        multiple = !!options[:multiple]

        reflection_method = :has_one
        reflection_method = :has_many if multiple

        name ||=  multiple ? :attachments : :attachment
        return false if self._reflections.keys.include?(name.to_s)

        send reflection_method, name, -> { where(assetable_field_name: name) }, as: :assetable, class_name: "Asset", dependent: :destroy, autosave: true
        accepts_nested_attributes_for name
        attr_accessible name, "#{name}_attributes"
      end

      def has_attachment(name = nil, **options)
        options[:multiple] = false
        has_attachments(name, **options)
      end

      def has_images(name = nil, **options)
        name ||= options[:multiple] ? :images : :image
        has_attachments(name, **options)
      end

      def has_image(name = nil, **options)
        options[:multiple] = false
        has_images(name, **options)
      end

      def attachable?
        self._reflections.select{|key, r| r.options[:class_name] == "Asset" }.any?
      end
    end
  end
end

ActiveRecord::Base.send(:include, Attachable::ActiveRecordExtensions)

