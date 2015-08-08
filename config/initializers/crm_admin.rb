require "crm_admin"

CrmAdmin.config do |config|
  config.included_models += ["test1"]

  puts "hello"
  puts self.inspect

  config.model Account do |m|
    m.visible false
  end
end

CrmAdmin.config do |config|
  config.included_models += ["test2"]

  puts "hello"
  puts self.inspect

  config.model ApartmentHouse do |m|
    m.visible false
  end
end