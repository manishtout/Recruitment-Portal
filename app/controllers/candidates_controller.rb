class CandidatesController < ApplicationController

  before_action :set_candidate, only: [:show, :edit, :update, :destroy]
  
  def index
  
    if params[:search]
      candidate = (Candidate.joins(:reports).where('interview_number LIKE ? or status LIKE ?', params[:search_field], params[:search_field]).where('name LIKE ? OR email LIKE ? ', "%#{params[:search]}%", "%#{params[:search]}%").where('user_id LIKE ?', "%#{current_user.id}%"))
      @candidates = candidate
      if @candidates.blank?
        flash[:alert] = "Candidate not found"
        @candidates = current_user.candidates
      end
    else
      @candidates = current_user.candidates
    end  
    @candidates =  @candidates.paginate(page: params[:page], per_page: 5).order('name ASC')
  end

  def show
    
    @reports = @candidate.reports
  end
  

  def new
    @candidate = current_user.candidates.build
  end

  def create
    @candidate = current_user.candidates.build(candidate_params)
    if @candidate.save
      redirect_to root_path
    else
      render "new" 
    end  
  end

  def update
    if @candidate.update(candidate_params)
      redirect_to root_path
    else
      redirect_to edit_candidate_path
    end
  end

  def destroy
    if @candidate.destroy
      redirect_to root_path, notice: "#{@candidate.name} candidate has no longer"
    end
  end

  private  

  def set_candidate
    @candidate = current_user.candidates.find(params[:id])
  end

  
  
  def candidate_params
    params.require(:candidate).permit(:name, :email, :passout_year, :phone_number, :document_pdf, :avatar)
  end
  
end
