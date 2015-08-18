class NestedResourcesController < ResourcesController
  prepend_before_action :set_nestable

  def resource_class
    super
  end

  def parent_resource_classes
    params.select{|k,v| k.to_s.scan(/_id\Z/).length > 0 }.map(&:first).map{|s| s[0, s.length - 3].classify.constantize }
  end

  def parent_resources
    params.select{|k,v| k.to_s.scan(/_id\Z/).length > 0 }.map{|k, v| k = k.to_s;  klass = k[0, k.length - 3].classify.constantize; klass.find(v) }
  end

  def index
    @resources = @nestable.send(resources_name)
  end

  def create

    init_new_instance



    #render inline: params.keys.inspect

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: "#{resource_class.to_s} was successfully created." }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def init_new_instance
    @resource ||= resource_class.new()
    @resource.assign_attributes(resource_params)
    @resource.send("#{nestable_attr_name}=", @nestable)
  end



  def set_nestable
    @nestable = parent_resources.last
  end

  def nestable_attr_name
    resource_name + "able"
  end


  def resource_params
    params.require(resource_name).permit(*resource_class.accessible_attributes)
  end
end