module Attachable
  module ActiveRecordExtensions
    extend ActiveSupport::Concern

    module ClassMethods

      def has_attachments(name = nil, **options)
        multiple = !!options[:multiple]
        name ||= :attachment
        return false if self._reflections.keys.include?(name.to_s)

        reflection_method = :has_one
        reflection_method = :has_many if multiple

        send reflection_method, name, -> { where(assetable_field_name: name) }, as: :assetable, class_name: "Asset", dependent: :destroy, autosave: true
        attr_accessible name
      end

      def has_attachment(name = nil, **options)
        options[:multiple] = false
        has_attachments(name, **options)
      end

      def attachable?
        self._reflections.select{|key, r| r.options[:class_name] == "Asset" }.any?
      end
    end
  end
end

ActiveRecord::Base.send(:include, Attachable::ActiveRecordExtensions)