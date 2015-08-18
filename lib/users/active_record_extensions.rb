module Users
  module ActiveRecordExtensions
    extend ActiveSupport::Concern

    module ClassMethods


    end
  end
end

ActiveRecord::Base.send(:include, Users::ActiveRecordExtensions)