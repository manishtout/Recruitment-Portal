class CandidatesController < ApplicationController

  def index
    @candidates = Candidate.all
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.user_id = current_user.id
    if @candidate.save
      redirect_to root_path
    else
      render "new" 
    end  
  end

  def edit
    @candidate = Candidate.find(params[:id])
  end

  def update
    @candidate = Candidate.find(params[:id])
    if @candidate.update(candidate_params)
      redirect_to root_path
    else
      redirect_to edit_candidate_path
    end
  end

  def destroy
    @candidate = Candidate.find(params[:id])
    if @candidate.destroy
      redirect_to root_path
    end
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :email, :passout_year, :phone_number)
  end
  
end
