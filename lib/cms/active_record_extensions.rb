module Cms
  module ActiveRecordExtensions
    extend ActiveSupport::Concern

    module ClassMethods

      def has_seo_tags
        has_one :seo_tags, class_name: "MetaTags", as: :page, autosave: true
        accepts_nested_attributes_for :seo_tags
        attr_accessible :seo_tags, :seo_tags_attributes
      end

      def has_html_block(name)
        name = name.to_sym
        has_one name, -> { where(attachable_field_name: name) }, class_name: "HtmlBlock", as: :attachable, autosave: true
        accepts_nested_attributes_for name
        attr_accessible name, "#{name}_attributes".to_sym
      end

      def has_sitemap_record
        has_one :sitemap_record, class_name: "SitemapElement", as: :page
        accepts_nested_attributes_for :sitemap_record
        attr_accessible :sitemap_record, :sitemap_record_attributes
      end
    end
  end
end

ActiveRecord::Base.send(:include, Cms::ActiveRecordExtensions)