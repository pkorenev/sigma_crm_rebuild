class Form

end

module CrmHelper
  extend SimpleForm::ActionViewExtensions::FormHelper
  def simple_form_with_context record, options = {}, &block
    simple_form_for record, options, &block
  end

  def my_simple_form_for &block
    f = Form.new
    f.instance_eval

  end
end