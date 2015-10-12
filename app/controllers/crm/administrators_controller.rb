class Crm::AdministratorsController < Crm::MainController


  def list_entries(*args)
    #super(*args).administrators
    Sigma::Manager.administrators
  end
end