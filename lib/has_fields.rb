module HasFields
  def field name, **options, &block
    @configured_fields ||= []
    @configured_fields << { name: name, options: options, block: block }
  end

  def fields *field_names, **options, &block

  end
end
