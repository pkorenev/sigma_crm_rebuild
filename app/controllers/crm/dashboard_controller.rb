module Crm
  class DashboardController < ApplicationController
    before_action :authenticate_account!, unless: :json_request?

    def index

    end
  end
end