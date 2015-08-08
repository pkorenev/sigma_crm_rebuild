require 'crm_admin/active_record_extensions'
require 'crm_admin/config'


module CrmAdmin
  def self.config(entity = nil, &block)
    CrmAdmin::Config.initialize

    unless block_given?
      return CrmAdmin::Config
    end

    if entity.nil?
      block.call(CrmAdmin::Config)
    else
      CrmAdmin::Config.current_config_context = entity
      block.call(CrmAdmin::Config::AbstractModel)
      CrmAdmin::Config.current_config_context = nil
    end
  end
end