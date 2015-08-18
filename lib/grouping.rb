module Grouping
  module HasGroups
    def group(name, &block)

    end

    def groups *group_names

    end

  end

  module Group
    extend HasFields
  end
end