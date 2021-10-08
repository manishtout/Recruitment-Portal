class Employer < ApplicationRecord
  has_many :users, through: :memberships
  after_create :create_membership
  def create_membership 
    @role = Role.find_by(character: "Admin")
    Membership.create(employer_id: @employer.id, user_id: current_user.id, role_id: @role.id)
  end
end
