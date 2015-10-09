class UserGroup < ActiveRecord::Base
  attr_accessible *attribute_names
  has_and_belongs_to_many :users, join_table: :user_memberships

  def user_permissions
    #RailsAdmin::Config::Actions.all.
    available_permissions = []
    root_action_names = RailsAdmin::Config::Actions.all(:root).map do |action|
      [action.action_name.to_s]
    end

    collection_action_names = RailsAdmin::Config::Actions.all(:collection).map do |action|
      [ action.action_name.to_s]
    end

    member_action_names = RailsAdmin::Config::Actions.all(:member).map do |action|
      [action.action_name.to_s]
    end

    action_names = root_action_names + collection_action_names + member_action_names

    root_actions = root_action_names#.map{|action_name| [true, action_name] } # Hash[action_names.map{|n| { :"#{n}" => true} }]

    #member_actions = []
    all_models = RailsAdmin::Config.models
    visible_models = RailsAdmin::Config.send(:visible_models_with_bindings, {})
    models = visible_models.map {|m| m.abstract_model.model }

    collection_actions = Hash[models.map {|m| actions = {}; actions = Hash[collection_action_names.map {|a| [a.first, [true, false].sample ] }  ]; [m.to_s,  actions ] }]
    member_actions = Hash[models.map {|m| actions = {}; actions = Hash[member_action_names.map {|a| [a.first, [true, false].sample ] }  ]; [m.to_s,  actions ] }]

    #member_actions = models.map {|m| actions = {}; actions = Hash[member_action_names.map {|a| [a, [true, false].sample ] }  ]; {:"#{m}" => actions } }

    user_permissions = { root_actions: root_actions, collection_actions: collection_actions,  member_actions: member_actions}





  end
end
