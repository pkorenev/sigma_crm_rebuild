


def require_gem(name)
  gems_path = Rails.root.join "../gems"
  require "#{gems_path}/#{name}/lib/#{name}"
end

def require_engine(name)
  engines_path = Rails.root.join "../engines"
  require "#{engines_path}/#{name}/lib/#{name}/engine"
end

# require_engine "crm"
#
# require_gem "addressable"