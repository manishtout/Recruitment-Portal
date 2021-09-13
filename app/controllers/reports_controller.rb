class ReportsController < ApplicationController

  def show
    @report = Report.where(candidate_id: params[:id])    
  end

  def new
    @report = Report.new
    $candidate = params[:candidate_id]
  end

  def create
    @report = Report.new(report_params)
    @report.candidate_id = $candidate
    if @report.save
      redirect_to candidates_path
    else
      render "new"
    end 
  end

  private

  def report_params
    params.require(:report).permit(:status, :interview_number, :feedback, :interviewer_name)
  end
end
