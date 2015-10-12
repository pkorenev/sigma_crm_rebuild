class Sigma::Manager < User



  scope :managers, -> { where(role: "manager") }
  scope :administrators, -> { where(role: "administrator") }
  scope :super_administrators, -> { where(role: "super_administrator") }




  #validates :email, :first_name, :middle_name, :last_name, :avatar, :role, :phone_number, presence: true

  # attr_accessible :role
  #
  # before_save do
  #   self.type = @user_role
  # end
  #
  # def role
  #   self.type.split("::").last
  # end
  #
  # def role=(role_name)
  #   @user_role = "Sigma::#{role_name}"
  # end


end