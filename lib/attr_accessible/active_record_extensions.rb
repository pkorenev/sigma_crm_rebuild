module AttrAccessible
  module ActiveRecordExtensions

    def self.included(base)
      base.class_eval do
        attr_accessible *attribute_names
      end
    end


  end
end

#ActiveRecord::Base.send(:include, AttrAccessible::ActiveRecordExtensions)