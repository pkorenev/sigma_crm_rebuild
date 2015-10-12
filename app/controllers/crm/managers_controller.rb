class Crm::ManagersController < Crm::MainController
  # def invite
  #   #super
  #   if request.get?
  #     @resource = model.new
  #
  #     @resource_permissions = @resource.user_permissions
  #   end
  # end

  def list_entries(*args)
    super(*args)#.managers
  end
end