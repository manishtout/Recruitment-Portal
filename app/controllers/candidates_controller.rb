class CandidatesController < ApplicationController

  before_action :set_candidate, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,only: [:bulk_destroy, :new, :create, :index, :update]
  before_action :set_candidate_checkbox, only: [:bulk_destroy]
  before_action :set_employer
  
  def index
    @candidates = @employer.candidates

    if params[:search].present?
      @candidates = @candidates.where('name like ? OR email like ?', "%#{params[:search]}%", "%#{params[:search]}%")
    end

    if params[:search_field]
      @candidates = @candidates.joins(:reports).where('reports.interview_number LIKE ? OR reports.status LIKE ?', "%#{params[:search_field]}%", "%#{params[:search_field]}%")
    end
    
    @candidates =  @candidates.paginate(page: params[:page], per_page: 5).order('name ASC')
  end



  def new
    @candidate = @employer.candidates.build
  end

  def create
    @candidate = @employer.candidates.build(candidate_params)
    @candidate.user_id = current_user.id
    if @candidate.save
      redirect_to employers_path
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

  def bulk_destroy
    @candidate_checkbox.destroy_all
    respond_to do |format|
      format.js {render "destroy"}
    end
  end

  private  

  def set_candidate
    @candidate = @employer.candidates.find(params[:id])
    @reports = @candidate.reports                                          #   also set reports of candidate
  end

  def set_employer
    @employer = Employer.find(params[:employer_id])
  end

  def set_candidate_checkbox
    @candidate_checkbox = @employer.candidates.where(id: params[:checkbox])
  end

  def candidate_params
    params.require(:candidate).permit(:name, :email, :passout_year, :phone_number, :document_pdf, :avatar, :candidate_ids, :checkbox)
  end
  
end
