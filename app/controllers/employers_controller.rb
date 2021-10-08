class EmployersController < ApplicationController

  before_action :employer_params, only: [:create]
  before_action :authenticate_user!

  def index
    @employers = Employer.all  
  end

  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.create(employer_params)
  end

  private

  def employer_params
    params.require(:employer).permit(:name, :email, :phone_number)
  end
end
