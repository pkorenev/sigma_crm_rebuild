module CrmAdminHelper
  def navigation_menu
    #CrmAdmin::Config.included_models.map{|m| next m if m.is_a?(Class); m.constantize  }
    CrmAdmin::Config.visible_models.try {|visible_models| visible_models.map{|m| next m if m.is_a?(String) || m.is_a?(Symbol); m.name  } } || []


  end
end