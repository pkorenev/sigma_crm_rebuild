# == Schema Information
#
# Table name: sigma_users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default("")
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string
#  invitations_count      :integer          default(0)
#

class User < ActiveRecord::Base
  extend Enumerize
  self.table_name = :sigma_users
  attr_accessible *attribute_names
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { thumb: "64x64#", large: "170x340#" }
  attr_accessible :avatar
  do_not_validate_attachment_file_type :avatar

  #has_many :permission_bindings, as: :permissionable
  #has_many :permissions, through: :permission_bindings

  has_many :permissions, as: :permissionable

  has_and_belongs_to_many :user_groups, class_name: "UserGroup", join_table: :user_memberships

  attr_accessible :password

  enumerize :role, in: [:manager, :administrator, :super_administrator]





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

  def first_and_middle_name
    "#{first_name} #{last_name}"
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end


end
