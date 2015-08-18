module Crm
  class ApartmentsController < BaseController
    def init_list_fields
      field :id
      field :price_from
      field :square
      field :status
    end
  end
end