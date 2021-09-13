class Report < ApplicationRecord
  belongs_to :candidate
  validates :status, presence: true, length: {maximum: 30}, format: { with: /[a-zA-Z]/, message: "only allow letters"}
  validates :interview_number, presence: true
  validates :feedback, presence: true, length: {maximum: 100}, format: { with: /[a-zA-Z]/, message: "only allow letters"}
  validates :interviewer_name, presence: true
end
