class Sigma::Manager < User
  extend Enumerize
  enumerize :role, in: [:manager, :administrator, :super_administrator]

  validates :email, :first_name, :middle_name, :last_name, :avatar, :role, :phone_number, presence: true

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

  def first_and_middle_name
    "#{first_name} #{last_name}"
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
end