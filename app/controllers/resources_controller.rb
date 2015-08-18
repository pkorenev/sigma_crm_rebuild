class ResourcesController < CrmController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]



  #self.layout false

  # GET /clients
  # GET /clients.json
  def index
    @resources ||= resource_class.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @resource ||= resource_class.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @resource ||= resource_class.new()
    @resource.assign_attributes(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: "#{resource_class.to_s} was successfully created." }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if resource.update(resource_params)
        format.html { redirect_to resource, notice: "#{resource_class.to_s} was successfully updated." }
        format.json { render :show, status: :ok, location: resource }
      else
        format.html { render :edit }
        format.json { render json: resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: "#{resource_class.to_s} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def resource
    @resource
  end

  def resource_class_name
    s = self.class.name
    c = s[0, s.length - "Controller".length].singularize
    c
  end

  def resource_class
    resource_class_name.constantize
  end

  def resources_url
    send("#{resources_path_name}_url")
  end

  def resources_path
    send("#{resources_path_name}_path")
  end

  def resource_path_name
    resource_name
  end

  def resources_path_name
    resources_name
  end

  def new_resource_path
    send("new_#{resource_path_name}_path")
  end

  def resource_name
    resource_class.to_s.underscore
  end

  def show_resource_path(resource = resource)
    send("#{resource_path_name}_path", resource)
    #url_for(resource)
  end

  def edit_resource_path(resource = resource)
    send("edit_#{resource_path_name}_path", resource)
  end





  def resources_name
    resource_name.pluralize
  end

  helper_method :show_resource_path, :new_resource_path, :resource_name, :resources_name, :resources_path, :edit_resource_path, :resource_class

  protected
  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    @resource ||= resource_class.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def resource_params
    #params[resource_name.to_sym]
    params.require(resource_name).permit(*resource_class.accessible_attributes)
  end
end