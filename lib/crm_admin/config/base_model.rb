module CrmAdmin
  module Config
    class BaseModel
      attr_accessor :model
      attr_accessor :fields
      attr_accessor :actions
      attr_accessor :plugins

      attr_accessor :included_fields

      def initialize(model)
        @model = model
      end

      def field name, type = nil, &block
        @included_fields ||= []
        type = field_type()
        {name: name}
      end

      def field_type(name)
        @model.columns.select{|c| c.name }
      end

      def fields *field_names, **options
        type = options.delete :type
        field_names.each do |field_name|
          field name, type
        end
      end
    end
  end
end