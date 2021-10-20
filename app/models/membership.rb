class Membership < ApplicationRecord
  belongs_to :role
  belongs_to :user
  belongs_to :employer  
  # validates :user_id
  validates :role_id, uniqueness: {scope: [:employer_id, :user_id], message: "Membership already exist"}
  validate :check_membership?

  # def find_employer(current_user_id)
  #   @employers=Employer.joins(memberships: :role).where(role: {character: 'Admin'}).where(memberships: {user_id: current_user_id}).pluck(:name, :id)
  #   return @employers   #return array of arrays which have employer's name and id
  # end

  def check_membership?
    @role_ids = Membership.where("employer_id = ? and user_id = ?",employer_id, user_id).pluck(:user_id)
    # debugger
    unless @role_ids.empty?
      @role_id= (Role.where("character = 'Admin'").pluck(:id)*"").to_i
      unless role_id == @role_id
        if @role_ids.include? @role_id
          @role_ids.delete(@role_id)
        end
        unless @role_ids.empty?
          unless Membership.where(role_id: @role_ids, employer_id: employer_id).empty?
            errors.add("Membership already exist")
          end
        end
      end
      # debugger
    end
    # @roles_id = Role.where(id: @memberships).pluck(:character)
    # if @roles_id.include? @roles_id
    #   errors.add("Membership already exist")     
    # end
  end

  def find_employer_user_role(employer, user, role)
    @eur = []
    @eur.push(Employer.find(employer).name)
    @eur.push(User.find(user).email)
    @eur.push(Role.find(role).character)
    return @eur
  end

end
