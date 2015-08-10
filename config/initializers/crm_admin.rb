require "crm_admin"

puts "hello from crm_admin"

CrmAdmin.config do |config|
  config.hide_models %w(Asset Infrastructure Address CrmDynamicRouter HouseTechnicalInfo Page User SeoTags RegisteredUser ClientInfo)

  puts "hello"
  puts self.inspect

  config.model Account do
    visible false
  end
end

# CrmAdmin.config do |config|
#   config.included_models += ["test2"]
#
#   puts "hello"
#   puts self.inspect
#
#   config.model ApartmentHouse do |m|
#     m.visible false
#   end
# end

#CrmAdmin::Config.build_config

CrmAdmin::Config.included_models = nil