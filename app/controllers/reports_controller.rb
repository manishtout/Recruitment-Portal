class ReportsController < ApplicationController
  before_action :get_candidate
  before_action :check_report, only: [:new]
  before_action :authenticate_user!, only: [:new, :create]
  # before_action :get_reports
  
  def index
    @reports = @candidate.reports
  end

  def new
    if @check
      @report = @candidate.reports.new 
    else
      return redirect_to root_path, notice: "#{@candidate.name} must be passed in previous round."
    end
  end
  
  def create
    @report = @candidate.reports.new(report_params)
    @candidate_reports = Candidate.find(params[:candidate_id]).reports
    if @candidate_reports.blank?
      @report.interview_number = "First"
    else
      @candidate_reports.each do |report|        
        if report.interview_number == "First"
          @report.interview_number = "Second"
          next;
        elsif report.interview_number == "Second"
          @report.interview_number = "Final"
        end  
      end
    end
    if @report.save
      redirect_to root_path, notice: "#{@candidate.name} have created a report"
    else
      render "new"
    end 
  end
  
  private

  def check_report  
    @check = @candidate.reports.check_status.blank?
  end
  
  def get_candidate
    @candidate = Candidate.find(params[:candidate_id])
  end  
  
  def report_params
    params.require(:report).permit(:status, :feedback, :interviewer_name)
  end

end
