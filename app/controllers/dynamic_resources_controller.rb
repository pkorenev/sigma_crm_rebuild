class DynamicResourcesController < ResourcesController
  def dashboard

  end

  def resource_class_name
    s = params[:resource_class].classify
    s
  end


end