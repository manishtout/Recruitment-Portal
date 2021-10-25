class Membership < ApplicationRecord
  belongs_to :role
  belongs_to :user
  belongs_to :employer  
  validates :user_id, uniqueness: {scope: :employer_id, message: "Membership already exist"}
  # validates :role_id, uniqueness: {scope: [:employer_id, :user_id], message: "Membership already exist"}

  def find_employer_user_role(employer, user, role)
    @eur = []
    @eur.push(Employer.find(employer).name)
    @eur.push(User.find(user).email)
    @eur.push(Role.find(role).character)
    return @eur
  end

end
