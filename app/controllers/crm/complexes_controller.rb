module Crm
  class ComplexesController < BaseController
    def init_list_fields
      field :name
      field :status
    end

    def resource_class_name
      "BuildingComplex"
    end
  end
end