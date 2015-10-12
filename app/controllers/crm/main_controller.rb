class Crm::MainController < RailsAdmin::MainController

  # before_action :initialize_before_action
  #
  # def initialize_before_action
  #   action = RailsAdmin::Config::Actions.find("#{params[:action]}".to_sym)
  #   @authorization_adapter.try(:authorize, action.authorization_key, @abstract_model, @object)
  #   @action = action.with({controller: self, abstract_model: @abstract_model, object: @object})
  #   fail(ActionNotAllowed) unless @action.enabled?
  #   @page_name = wording_for(:title)
  # end
  #
  #
  # def model
  #   @model ||= @abstract_model.model
  # end

  def list_entries *args
    #entries = super
    #entries.where("role is null")
    super(*args)
  end



  # def index
  #
  # end
  #
  # def edit
  #
  # end
  #
  # def create
  #
  # end
  #
  # def show
  #
  # end
end