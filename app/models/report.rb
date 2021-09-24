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

  

end
