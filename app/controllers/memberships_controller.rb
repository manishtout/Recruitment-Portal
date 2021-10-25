class MembershipsController < ApplicationController
  load_and_authorize_resource :employer
  load_and_authorize_resource :membership, through: :employer
  before_action :get_employer 
  before_action :member_params

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
    debugger
    params.require(:membership).permit(:user_id, :role_id)
  end

  def get_employer
    @employer = Employer.find(params[:employer_id])
  end

end
