class CrmAdminController < ResourcesController
  #prepend_view_path "app/views/crm_admin"
  layout "crm"

  def self.parse_caller(at)
    if /^(.+?):(\d+)(?::in `(.*)')?/ =~ at
      file = Regexp.last_match[1]
      line = Regexp.last_match[2].to_i
      method = Regexp.last_match[3]
      [file, line, method]
    end
  end

  def self.call_me
    return File.dirname(parse_caller(caller[0]).first)
  end

  def dashboard
    # a = rand(1..3)
    # if a != 3
    #   CrmAdmin::Config.included_models = a
    # end
    # render inline: CrmAdmin::Config.included_models.inspect

    #render inline: "hi"
  end

  def resource_class_name
    s = params[:resource_class].classify
    s
  end

  def resource_class_slug
    resource_class_name.underscore.gsub("/", "~")
  end

  def default_url_options
    h = super || {}
    h[:resource_class] = resource_class_slug
  end


  def resources_path(options = {})
    s = options[:resource_class]
    s = s.underscore.gsub("/", "~")
    #next m if m.is_a?(String) || m.is_a?(Symbol); m.name
    options[:resource_class] = s
    Rails.application.routes.url_helpers.crm_admin_resources_path(options)
  end

  def resource_path(resource, options = {})
    s = resource.class.name
    s = s.underscore.gsub("/", "~")
    #next m if m.is_a?(String) || m.is_a?(Symbol); m.name
    options[:resource_class] = s
    options[:resource_id] = resource.id
    Rails.application.routes.url_helpers.crm_admin_resource_path(options)
  end

  helper_method :resource_path

  def set_resource
    @resource ||= resource_class.find(params[:resource_id])
  end



end