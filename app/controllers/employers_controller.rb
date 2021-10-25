class EmployersController < ApplicationController
  before_action :employer_params, only: [:create]

  def index
    @employers = Employer.all  
  end

  def show
    @employer = Employer.find(params[:id])
    authorize! :read, @employer
    @user_role = @employer.find_authorize_user_role(@employer.id)
  end

  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.new(employer_params) 
    if @employer.save
      @role = Role.find_by(character: "Admin")
      @role.memberships.create(employer_id: @employer.id, user_id: current_user.id)
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def employer_params
    params.require(:employer).permit(:name, :email, :phone_number)
  end
end
