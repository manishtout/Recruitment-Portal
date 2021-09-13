class ReportsController < ApplicationController

  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report = @candidate.id
    if @report.save
      redirect_to root_path
  end

  private

  def report_params
    params.require(:reports).permit(:status, :interview_number, :feedback, :interviewer_name, :candidate_it)
  end
end
