class AdminUsersController < CrmAdminController
  def index
    @data_table = data_table do
      disable_plugins :attachable, :addressable unless @user.try &:admin?
      fields :name, :age, :photo, :address
      page params[:page]
    end




  end

  def resource_class
    AdministrativeUser
  end
end