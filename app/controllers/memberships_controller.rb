class MembershipsController < ApplicationController
  before_action :get_employer

  def index
    @memberships = Membership.all
  end

  def new
    @roles = Role.all
    @users = User.all
    @membership = @employer.memberships.new
  end
  
  def create
    @membership = @employer.memberships.new(member_params)
    if @membership.save
      redirect_to employer_path(@membership.employer_id)
    else 
      @roles = Role.all
      @users = User.all
      render "new"
    end  
  end
  
  private
  
  def member_params   
    params.require(:membership).permit(:user_id, :employer_id, :role_id)
  end

  def get_employer
    @employer = Employer.find(params[:employer_id])
  end

end
