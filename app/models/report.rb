class Report < ApplicationRecord
  belongs_to :candidate
  validates :status, presence: true, length: {maximum: 30}, format: { with: /[a-zA-Z]/, message: "only allow letters"}
  validates :interview_number, presence: true
  validates :feedback, presence: true, length: {maximum: 100}, format: { with: /[a-zA-Z]/, message: "only allow letters"}
  validates :interviewer_name, presence: true
  validate :check_status?
  
  scope :check_status, -> { where(:status => "Fail") }

  def check_status?
    unless Report.where(status: "Fail",candidate_id: candidate_id).empty?
      errors.add(:status, "must be pass in previous round")
    end 
  end

  def candidate_interview_round(c_id)     #c_id candidate id 
    reports = Candidate.find(c_id).reports
    @r = ""
    if reports.empty?
      @r = "First"
    else
      reports.each do |report|        
        if report.interview_number == "First"
          @r = "Second"
          next;
        elsif report.interview_number == "Second"
          @r = "Final"
        end  
      end
    end
    return @r  
  end

end
