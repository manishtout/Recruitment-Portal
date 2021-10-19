class Membership < ApplicationRecord
  belongs_to :role
  belongs_to :user
  belongs_to :employer  
  validate :check_membership?

  def find_employer(current_user_id)
    @employers=Employer.joins(memberships: :role).where(role: {character: 'Admin'}).where(memberships: {user_id: current_user_id}).pluck(:name, :id)
    return @employers   #return array of arrays which have employer's name and id
  end

  def check_membership?
    # debugger
    unless Membership.where("employer_id = ? and user_id = ? and role_id = ? ",employer_id, user_id, role_id).empty?
      errors.add("Membership already exist")
    end    
  end

  def self.find_employer_user_role(employer, user, role)
    @eur = []
    @eur.push(Employer.find(employer).name)
    @eur.push(User.find(user).email)
    @eur.push(Role.find(role).character)
    return @eur
  end

end
