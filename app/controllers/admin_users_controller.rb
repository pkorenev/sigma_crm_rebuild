class AdminUsersController < CrmAdminController
  def index
    @datatable = data_table do
      disable_plugins :attachable, :addressable unless @user.try &:admin?
      fields :name, :age, :photo, :address
      page params[:page]
    end

    @data_table =


  end

  def resource_class
    AdministrativeUser
  end
end