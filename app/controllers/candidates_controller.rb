class CandidatesController < ApplicationController

  before_action :set_candidate, only: [:show, :edit, :update, :destroy]
  
  
  def index
    @candidates = current_user.candidates

    if params[:search].present?
      @candidates = @candidates.where('name like ? OR email like ?', "%#{params[:search]}%", "%#{params[:search]}%")
    end

    if params[:search_field]
      @candidates = @candidates.joins(:reports).where('reports.interview_number LIKE ? OR reports.status LIKE ?', "%#{params[:search_field]}%", "%#{params[:search_field]}%")
    end
    
    @candidates =  @candidates.paginate(page: params[:page], per_page: 5).order('name ASC')
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
    @candidate.destroy
  end

  private  

  
  def set_candidate
    @candidate = current_user.candidates.find(params[:id])
    @reports = @candidate.reports
  end

  def set_reports
  end

  def candidate_params
    params.require(:candidate).permit(:name, :email, :passout_year, :phone_number, :document_pdf, :avatar)
  end
  
end
