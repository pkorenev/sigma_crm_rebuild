class Permission < ActiveRecord::Base
  #has_many :permission_bindings
  #has_many :permissionables, through: :permission_bindings
  belongs_to :permissionable, polymorphic: true
end
