class EmployersController < ApplicationController
  # load_and_authorize_resource

  before_action :employer_params, only: [:create]
  before_action :authenticate_user!

  def index
    @employers = Employer.all  
  end

  def show
    @employer = Employer.find(params[:id])
    begin
      @user_role = @employer.find_authorize_user_role(@employer.id)
      authorize! :show, @employer
    rescue
      @user_role = @employer.find_user_role(@employer.id, current_user.id)
    end
  end

  def new
    @employer = Employer.new
  end

  def create
    if @employer = Employer.create(employer_params)  
      @role = Role.find_by(character: "Admin")
      Membership.create(employer_id: @employer.id, user_id: current_user.id, role_id: @role.id)
      redirect_to root_path
    end
  end

  private

  def employer_params
    params.require(:employer).permit(:name, :email, :phone_number)
  end
end
