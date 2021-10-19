class Employer < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  validates :email, presence: true, uniqueness: true, format: { with: /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i}  
  
  def find_authorize_user_role(employer)
    @memberships = Membership.where("employer_id = ?", employer).pluck(:user_id, :role_id)
    user=[]
    role=[]
    @memberships.each do |memberships|
      user.push(User.where("id = ?", memberships[0]).pluck(:email)*"")
      role.push(Role.where("id = ?", memberships[1]).pluck(:character)*"")
    end
    # debugger  
    return[user,role]
  end

  def find_user_role(employer,login_user)
    @memberships = Membership.where("employer_id = ?  ", employer)
     if @memberships.pluck(:user_id).include? login_user
      @membership_array = []
      @memberships.each do |membership|
        if membership.user_id == login_user || membership.role_id == 1
          @membership_array.push(membership)
        end
      end
      @user_role = @membership_array.pluck(:user_id, :role_id)
      unless @user_role.nil?
        user=[]
        role=[]
        @user_role.each do |memberships|
          user.push(User.where("id = ?", memberships[0]).pluck(:email)*"")
          role.push(Role.where("id = ?", memberships[1]).pluck(:character)*"")
        end 
        return[user,role]
      end
    end
  end

end
