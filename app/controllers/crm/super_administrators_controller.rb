class Crm::SuperAdministratorsController < Crm::MainController
  def list_entries(*args)
    #super.super_administrators
    #Sigma::Manager.all.super_administrators
    Sigma::Manager.super_administrators
  end
end