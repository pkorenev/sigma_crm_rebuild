module Crm
  class ComplexesController < BaseController
    def init_list_fields
      field :name
      field :status
    end

    def init_edit_fields
      reset_fields

      field :name
      field :address
      field :main_info do
        field :house_class
      end
    end

    def resource_class_name
      "BuildingComplex"
    end

    def resource_path_name
      "crm_complex"
    end

    def resources_path_name
      "crm_complexes"
    end
  end
end