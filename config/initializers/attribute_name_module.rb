module CommonAttributeName
  def human_attribute_name(attr_name)
    classes = [self]
    res = nil
    classes.each do |klass|
      class_selector = klass.name.underscore
      begin
        res = I18n.t("activerecord.attributes.#{class_selector}.#{attr_name}", raise: true)
        res = nil if res.blank?
        break
      rescue
        next
      end
    end

    unless res
      res = I18n.t("activerecord.attributes.#{attr_name}", raise: true)
      res = nil if res.blank?
    end

    res = attr_name.humanize

    res
  end
end

# Sigma.constants.each do |const_name|
#   c = Sigma.const_get(const_name)
#   is_model = c.is_a?(ActiveRecord::Base)
#   if is_model
#     c.send(:extend, CommonAttributeName)
#   end
# end